import 'package:flutter/material.dart';
<<<<<<< Updated upstream

import '../../recursec/app_colors.dart';

Widget bottomNavigationBar() {
  return Container(
    height: 75,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: Offset.fromDirection(1),
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
        ),
      ],
      color: AppColors.white100,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/home.png'),
            ),
            label: 'Главная'),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/category.png'),
          ),
          label: 'Подборки',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.amber,
          icon: ImageIcon(
            AssetImage('assets/icons/voice.png'),
          ),
          label: 'Запись',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/paper.png'),
          ),
          label: 'Аудиозаписи',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/profile.png'),
          ),
          label: 'Профиль',
        ),
      ],
    ),
  );
=======
import 'package:provider/provider.dart';
import '../../models/view_model.dart';
import '../../recursec/app_colors.dart';
import '../../recursec/app_icons.dart';
import '../../utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65.0,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 1.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 3.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _ButtonItem(
              title: 'Главная',
              icon: AppIcons.tabbar_home,
              index: 0,
            ),
            _ButtonItem(
              title: 'Подбoрки',
              icon: AppIcons.tabbar_category,
              index: 1,
            ),
            _RecordItem(),
            _ButtonItem(
              title: 'Аудиозаписи',
              icon: AppIcons.tabbar_paper,
              index: 3,
            ),
            _ButtonItem(
              title: 'Профиль',
              icon: AppIcons.tabbar_profile,
              index: 4,
            )
          ],
        ),
      ),
    );
  }
}

class _ButtonItem extends StatelessWidget {
  final String title;
  final String icon;
  final int index;
  const _ButtonItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<Navigation>();

    void _setIndex(int index) {
      model.setCurrentIndex = index;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            icon: Image.asset(
              icon,
              color: model.currentIndex == index
                  ? AppColors.colorAppbar
                  : Colors.black,
            ),
            onPressed: () {
              // _setIndex(index);
            }),
        Text(title,
            style: kBottombarTextStyle.copyWith(
              color: model.currentIndex == index
                  ? AppColors.colorAppbar
                  : Colors.black,
            ))
      ],
    );
  }
}

class _RecordItem extends StatelessWidget {
  const _RecordItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<Navigation>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: AppColors.pinkRec),
          child: GestureDetector(
            onTap: () {
              model.setCurrentIndex = 2;
            },
            child: Image.asset(
              AppIcons.microfon,
              width: 35,
              height: 35,
              color: model.currentIndex != 2 ? Colors.white : AppColors.pinkRec,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Запись',
          style: kBottombarTextStyle.copyWith(
              color:
                  model.currentIndex != 2 ? AppColors.pinkRec : Colors.white),
        )
      ],
    );
  }
>>>>>>> Stashed changes
}
