import 'package:audio_fairy_tales/pages/voise_pages/bloc/record_bloc.dart';
import 'package:audio_fairy_tales/pages/voise_pages/voise_widgets/play_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart' as ap;

import '../../utils/constants.dart';
import '../../widgets/uncategorized/appbar_menu.dart';
import 'voise_widgets/recording_widget.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);
  static const routeName = '/record_page';

  @override
  RecordPageState createState() => RecordPageState();
}

class RecordPageState extends State<RecordPage> {
  final bool shouldPop = false;
  bool showPlayer = false;
  ap.AudioSource? audioSource;
  String? path;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider<RecordingsPageBloc>(
      create: (context) => RecordingsPageBloc(),
      child: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    const AppbarMenu(),
                    Positioned(
                      left: 5.0,
                      top: 30.0,
                      child: Container(
                        height: screenHeight - 180.0,
                        width: screenWidth * 0.97,
                        decoration: borderContainer2,
                        child: showPlayer
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: AudioPlayer(
                                  source: audioSource!,
                                  onDelete: () {
                                    setState(() => showPlayer = false);
                                  },
                                ),
                              )
                            : AudioRecorder(
                                onStop: (path) {
                                  setState(() {
                                    audioSource = ap.AudioSource.uri(
                                      Uri.parse(path),
                                    );
                                    showPlayer = true;
                                  });
                                },
                              ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
