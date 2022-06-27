import 'package:flutter/material.dart';
import '../../recursec/app_colors.dart';
import '../../widgets/uncategorized/main_clip_path.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({Key? key}) : super(key: key);
  static const routeName = '/collections_page';

  @override
  State<CollectionsPage> createState() => _VoicePageState();
}

class _VoicePageState extends State<CollectionsPage> {
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
