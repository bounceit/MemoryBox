import 'package:audio_fairy_tales/blocs/bloc_navigations/navigation_bloc.dart';
import 'package:audio_fairy_tales/widgets/uncategorized/custom_shape.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections/collections.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/collections_edit.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../blocs/bloc_navigations/navigation_state.dart';
import '../../../../../repositories/collections_repositories.dart';
import '../../../../../utils/constants.dart';
import '../../../../../widgets/navigation/navigate_to_page.dart';

class AppbarHeaderCollectionAddAudioInCollection extends StatelessWidget {
  const AppbarHeaderCollectionAddAudioInCollection({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(),
            ClipPath(
              clipper: Customshape(),
              child: Container(
                color: AppColors.colorAppbar2,
                width: double.infinity,
                height: 280.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Uuid uuid = const Uuid();
                      String id = uuid.v1();
                      CollectionsRepositories.instance.addCollections(
                        'Без названия',
                        '...',
                        '',
                        id,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CollectionsEdit(
                            idCollection: id,
                            titleCollection: 'Без названия',
                            subTitleCollection: '...',
                            imageCollection: '',
                          );
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Подборки',
                    style: twoTitleTextStyle,
                  ),
                  GestureDetector(
                    onTap: () => NavigateToPage.instance?.navigate(
                      context,
                      index: 1,
                      currentIndex: state.currentIndex,
                      route: Collections.routeName,
                    ),
                    child: const Text(
                      'Добавить',
                      style: threeTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
