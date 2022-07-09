import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/uncategorized/main_clip_path.dart';
import '../../widgets/main_page_widgets/audio_stack.dart';
import '../../widgets/main_page_widgets/main_selections.dart';

class MainPageWidget extends StatefulWidget {
  static const routeName = '/';

  const MainPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                const MainClipPath(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Подборки',
                            style: TextStyle(
                              color: AppColors.white100,
                              fontFamily: 'TTNorms',
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Открыть все',
                              style: TextStyle(
                                color: AppColors.white100,
                                fontFamily: 'TTNorms',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 230,
                            width: 180,
                            child: SelectionOne(),
                          ),
                          SizedBox(
                            height: 230,
                            width: 180,
                            child: Column(
                              children: const [
                                SelectionTwo(),
                                SizedBox(height: 10),
                                SelectoinThree(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: AudioStackWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
