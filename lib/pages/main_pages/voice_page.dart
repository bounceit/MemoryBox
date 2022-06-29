import 'package:flutter/material.dart';

import '../../recursec/app_colors.dart';

import '../../widgets/uncategorized/main_clip_path.dart';

class VoisePage extends StatefulWidget {
  static const routeName = '/voice_page';

  const VoisePage({Key? key}) : super(key: key);

  @override
  State<VoisePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoisePage> {
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
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: const [
                const MainClipPath(),
                const Padding(
                  padding: const EdgeInsets.only(top: 70, right: 5, left: 5),
                  child: RecordingWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecordingWidget extends StatefulWidget {
  const RecordingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RecordingWidget> createState() => _RecordingWidgetState();
}

class _RecordingWidgetState extends State<RecordingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
