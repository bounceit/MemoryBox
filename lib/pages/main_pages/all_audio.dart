import 'package:flutter/material.dart';
import '../../recursec/app_colors.dart';
import '../../widgets/uncategorized/main_clip_path.dart';

class SellectionsPage extends StatefulWidget {
  const SellectionsPage({Key? key}) : super(key: key);
  static const routeName = '/selection_page';

  @override
  State<SellectionsPage> createState() => _SellectionsPage();
}

class _SellectionsPage extends State<SellectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: AppColors.violet,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
          color: AppColors.white100,
          iconSize: 30,
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: const [
          MainClipPath(),
        ],
      ),
    );
  }
}
