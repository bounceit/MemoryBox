import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/recursec/app_icons.dart';
import 'package:audio_fairy_tales/widgets/buttons/icon_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/constants.dart';
import '../bloc/add_audio_bloc.dart';

class AppbarHeaderCollectionAddAudio extends StatelessWidget {
  const AppbarHeaderCollectionAddAudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        ClipPath(
          clipper: Customshape(),
          child: Container(
            color: AppColors.colorAppbar2,
            width: double.infinity,
            height: 220.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 15.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBack(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Text(
                  'Выбрать',
                  style: twoTitleTextStyle,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: Text(
                    'Добавить',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white100),
                  ),
                ),
              ),
            ],
          ),
        ),
        const _SearchPanel(),
      ],
    );
  }
}

class _SearchPanel extends StatelessWidget {
  const _SearchPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 121.0,
        right: 12.0,
      ),
      child: Container(
        height: 60.0,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              30.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 29,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: screenWidth * 0.65,
                  child: TextField(
                    onChanged: (searchTxt) {
                      var text = searchTxt;
                      context.read<CollectionAddAudioBloc>().add(
                            LoadCollectionAddAudioEvent(
                              sort: text.toLowerCase(),
                            ),
                          );
                    },
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: AppColors.colorText,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Поиск',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.colorText50,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )),
              Image.asset(
                AppIcons.search,
                color: AppColors.colorText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
