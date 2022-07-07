import 'package:audio_fairy_tales/pages/voise_pages/voise_widgets/play_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../recursec/app_colors.dart';
import 'package:just_audio/just_audio.dart' as ap;
import '../../utils/constants.dart';
import '../../widgets/uncategorized/main_clip_path.dart';
import 'model_voise_page.dart';
import 'voise_widgets/recording_widget.dart';

class VoisePage extends StatefulWidget {
  const VoisePage({Key? key}) : super(key: key);
  static const routeName = '/voice_page';
  static Widget create() {
    return ChangeNotifierProvider<ModelRP>(
      create: (BuildContext context) => ModelRP(),
      child: const VoisePage(),
    );
  }

  @override
  State<VoisePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoisePage> {
  bool isShowPlayer = false;
  ap.AudioSource? audioSource;
  String? path;

  @override
  void initState() {
    isShowPlayer = false;
    super.initState();
  }

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
              children: [
                const MainClipPath(),
                Padding(
                  padding: const EdgeInsets.only(top: 70, right: 5, left: 5),
                  child: Container(
                    decoration: boxDecoration,
                    child: isShowPlayer
                        ? Padding(
                            padding: EdgeInsets.all(16),
                            child: AudioPlayerWidget(
                              source: audioSource!,
                            ),
                          )
                        : RecordingWidget(onStop: (path) {
                            setState(() {
                              audioSource = ap.AudioSource.uri(Uri.parse(path));
                              isShowPlayer = true;
                            });
                          }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
