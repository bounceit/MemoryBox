import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, //убрать нижнюю границу
      titleSpacing: 10, // отступы

      backgroundColor: Colors.transparent, // прозрачный цвет
      // backgroundColor: const Color(0xFF8C84E2),
      title: Container(
        margin: const EdgeInsets.only(right: 350, bottom: 20),
        child: const Icon(
          Icons.menu_outlined,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0); //отступ с верху
  }
}
