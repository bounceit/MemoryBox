import 'package:flutter/material.dart';
import '../../recursec/app_colors.dart';
import '../../widgets/uncategorized/audio_clip_shape.dart';
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
        title: Center(
          child: Column(
            children: const [
              Text('Аудиозаписи'),
              Text('Все в одном месте'),
            ],
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: AppColors.audioAppBar,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
              color: AppColors.white100,
              iconSize: 30,
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: const [
          AudioShape(),
        ],
      ),
    );
  }
}
