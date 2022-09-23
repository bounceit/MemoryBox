import 'package:audio_fairy_tales/pages/main_pages/all_audio_pages/sellections_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/bloc_navigations/navigation_bloc.dart';
import '../../blocs/bloc_navigations/navigation_event.dart';
import '../../blocs/bloc_navigations/navigation_state.dart';
import '../../pages/drawer_pages/audio_delete_pages/audio_delete_page.dart';
import '../../pages/drawer_pages/search_page/search_page.dart';
import '../../pages/drawer_pages/subscriptions_page/subscription_page.dart';
import '../../pages/drawer_pages/support_page/support_page.dart';
import '../../pages/home_pages/home_page.dart';
import '../../pages/main_pages/collections_pages/collections/collections.dart';
import '../../pages/main_pages/profile_pages/profile_page/profile.dart';
import '../../recursec/app_colors.dart';
import '../../recursec/app_icons.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);
  void _navigateToPage(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String route,
  }) {
    Navigator.pop(context);

    if (index != currentIndex) {
      context.read<NavigationBloc>().add(
            NavigateMenu(
              menuIndex: index,
              route: route,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: AppColors.white100,
                  ),
                  child: Center(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Аудиосказки',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Меню',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: AppColors.colorText50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextButton(
                        title: 'Главная',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 0
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: HomePage.routeName,
                          currentIndex: state.currentIndex,
                          index: 0,
                        ),
                        image: AppIcons.tabbarHome,
                        color: state.currentIndex == 0
                            ? AppColors.colorText50
                            : AppColors.colorText,
                      ),
                      CustomTextButton(
                        title: 'Профиль',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 4
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: Profile.routeName,
                          currentIndex: state.currentIndex,
                          index: 4,
                        ),
                        image: AppIcons.tabbarProfile,
                        color: state.currentIndex == 4
                            ? AppColors.colorText50
                            : AppColors.colorText,
                      ),
                      CustomTextButton(
                        title: 'Подборки',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 1
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: Collections.routeName,
                          currentIndex: state.currentIndex,
                          index: 1,
                        ),
                        image: AppIcons.tabbarCategory,
                        color: state.currentIndex == 1
                            ? AppColors.colorText50
                            : AppColors.colorText,
                      ),
                      CustomTextButton(
                        title: 'Все аудеофайлы',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 3
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: SellectionsPage.routeName,
                          currentIndex: state.currentIndex,
                          index: 3,
                        ),
                        image: AppIcons.tabbarPaper,
                        color: state.currentIndex == 3
                            ? AppColors.colorText50
                            : AppColors.colorText,
                      ),
                      CustomTextButton(
                        title: 'Поиск',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 6
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: SearchPage.routeName,
                          currentIndex: state.currentIndex,
                          index: 6,
                        ),
                        image: AppIcons.drawerSearch,
                        color: state.currentIndex == 6
                            ? AppColors.colorText50
                            : AppColors.colorText,
                      ),
                      CustomTextButton(
                        title: 'Недавно удалённые',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 5
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: DeletePage.routeName,
                          currentIndex: state.currentIndex,
                          index: 5,
                        ),
                        image: AppIcons.recDelete,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextButton(
                        title: 'Подписка',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 7
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: SubscriptionPage.routeName,
                          currentIndex: state.currentIndex,
                          index: 7,
                        ),
                        image: AppIcons.drawerWallet,
                        color: state.currentIndex == 7
                            ? AppColors.colorText50
                            : AppColors.colorText,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextButton(
                        title: 'Написать в \n поддержку',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: state.currentIndex == 8
                              ? AppColors.colorText50
                              : AppColors.colorText,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () => _navigateToPage(
                          context,
                          route: SupportMessagePage.routeName,
                          currentIndex: state.currentIndex,
                          index: 8,
                        ),
                        image: AppIcons.drawerEdit,
                        color: state.currentIndex == 8
                            ? AppColors.colorText50
                            : AppColors.colorText,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    this.style,
    required this.onTap,
    required this.image,
    this.color,
  }) : super(key: key);

  final String title;
  final String image;
  final TextStyle? style;
  final Color? color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 23.0,
              width: 23.0,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                color: color,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
