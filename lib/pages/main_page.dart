import 'package:audio_fairy_tales/widgets/navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';
import '../widgets/uncategorized/main_clip_path.dart';
import '../widgets/main_page_widgets/audio_stack.dart';
import '../widgets/main_page_widgets/main_selections.dart';
import '../widgets/navigation/bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: const [
              MainClipPath(),
              Positioned(
                left: 16,
                right: 200,
                top: 160,
                child: SelectionOne(),
              ),
              Positioned(left: 200, right: 20, top: 160, child: SelectionTwo()),
              Positioned(
                  left: 200, right: 20, top: 270, child: SelectoinThree())
            ],
          ),
          const SizedBox(height: 40),
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: AudioStackWidget(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
