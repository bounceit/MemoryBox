import 'package:audio_fairy_tales/pages/main_pages/collections_pages/appbar_header_collections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'collections_model.dart';
import 'list_collections.dart';

class Collections extends StatefulWidget {
  const Collections({Key? key}) : super(key: key);
  static const routeName = '/collections_page';
  static Widget create() {
    return ChangeNotifierProvider<CollectionModel>(
        create: (BuildContext context) => CollectionModel(),
        child: const Collections());
  }

  @override
  State<Collections> createState() => _VoicePageState();
}

class _VoicePageState extends State<Collections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //   backgroundColor: AppColors.violet,
      //   leading: IconButton(
      //     onPressed: () {
      //       Scaffold.of(context).openDrawer();
      //     },
      //     icon: const Icon(
      //       Icons.menu,
      //     ),
      //     color: AppColors.white100,
      //     iconSize: 30,
      //   ),
      //   elevation: 0.0,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            const AppbarHeaderCollection(),
            ListCollections(),
          ],
        ),
      ),
    );
  }
}
