// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_page/widgets/appbar_profile.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_page/widgets/delete_acc.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_page/widgets/name_number.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_page/widgets/photo_profile.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_page/widgets/progress_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/bloc_navigations/navigation_bloc.dart';
import '../../../../blocs/bloc_navigations/navigation_state.dart';
import '../../../../repositories/auth_repository.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/navigation/navigate_to_page.dart';
import '../../../../widgets/uncategorized/text_link.dart';
import '../../../drawer_pages/subscriptions_page/subscription_page.dart';
import '../profile_edit_page/profile_edit_page.dart';
import 'bloc/profile_bloc.dart';
import 'bloc/progress_indicator_bloc/indicator_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const routeName = '/profile';
  final bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProgressIndicatorBloc>(
          create: (context) => ProgressIndicatorBloc()
            ..add(
              const LoadProgressIndicatorEvent(),
            ),
        ),
        BlocProvider<ProfilePageBloc>(
          create: (context) => ProfilePageBloc()
            ..add(
              const ProfilePageEvent(),
            ),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              'Профиль',
              style: oneTitleTextStyle,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Stack(
                  children: const [
                    AppbarHeaderProfileProfile(),
                    PhotoProfileProfile(),
                  ],
                ),
              ),
              AuthRepositories.instance.user == null
                  ? Flexible(
                      flex: 6,
                      child: _LinksNotAuthorization(
                        screenWidth: screenWidth,
                      ),
                    )
                  : Flexible(
                      flex: 6,
                      child: _Links(
                        screenWidth: screenWidth,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Links extends StatelessWidget {
  _Links({Key? key, required this.screenWidth}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  final double screenWidth;
  bool _checkStatus(ProgressIndicatorStatus status) {
    if (status == ProgressIndicatorStatus.initial) {
      return false;
    }
    if (status == ProgressIndicatorStatus.emptyList) {
      return false;
    }
    if (status == ProgressIndicatorStatus.failed) {
      return false;
    }
    if (status == ProgressIndicatorStatus.success) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return BlocBuilder<ProfilePageBloc, ProfilePageState>(
          builder: (context, state2) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    child: Column(
                      children: [
                        NameAndNumber(screenWidth: screenWidth * 0.75),
                        TextLink(
                          onPressed: () async {
                            final userName = state2.name;
                            final userImage = state2.image;
                            final userNumber = state2.number;
                            List result = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProfileEdit(
                                userName: userName!,
                                userImage: userImage!,
                                userNumber: userNumber!,
                              );
                            }));
                            if (result.isNotEmpty) {
                              context.read<ProfilePageBloc>().add(
                                    ProfilePageEvent(
                                      name: result[0],
                                      number: result[1],
                                      image: result[2],
                                    ),
                                  );
                            }
                          },
                          text: 'Редактировать',
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: SizedBox(
                    child: Column(
                      children: [
                        TextLink(
                          onPressed: () => NavigateToPage.instance?.navigate(
                            context,
                            index: 7,
                            currentIndex: state.currentIndex,
                            route: SubscriptionPage.routeName,
                          ),
                          underline: false,
                          text: 'Подписка',
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        BlocBuilder<ProgressIndicatorBloc,
                            ProgressIndicatorState>(
                          builder: (context, state) {
                            if (_checkStatus(state.status)) {
                              final user = state.progressIndicator.last;
                              return CustomProgressIndicator(
                                size: user.totalSize ?? 0,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextLink(
                                text: 'Вийти из приложения',
                                onPressed: () async {
                                  await _auth.signOut();
                                  exit(0);
                                },
                              ),
                              DeleteAccount(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _LinksNotAuthorization extends StatelessWidget {
  _LinksNotAuthorization({Key? key, required this.screenWidth})
      : super(key: key);
  final _auth = FirebaseAuth.instance;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                child: Column(
                  children: [
                    NameAndNumber(
                      screenWidth: screenWidth * 0.75,
                    ),
                    TextLink(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ProfileEdit.routeName,
                        );
                      },
                      text: 'Редактировать',
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: SizedBox(
                child: Column(
                  children: [
                    TextLink(
                      onPressed: () => NavigateToPage.instance?.navigate(
                        context,
                        index: 7,
                        currentIndex: state.currentIndex,
                        route: SubscriptionPage.routeName,
                      ),
                      underline: false,
                      text: 'Подписка',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CustomProgressIndicator(
                      size: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextLink(
                            text: 'Вийти из приложения',
                            onPressed: () async {
                              await _auth.signOut();
                              exit(0);
                            },
                          ),
                          DeleteAccount(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
