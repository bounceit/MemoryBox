import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/search_page/bloc/search_bloc.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../recursec/app_icons.dart';
import '../../../../utils/constants.dart';

class AppbarHeaderSearchPage extends StatelessWidget {
  const AppbarHeaderSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        ClipPath(
          clipper: Customshape(),
          child: Container(
            color: AppColors.colorAppbar,
            width: double.infinity,
            height: 160.0,
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Найди потеряшку',
            style: twoTitleTextStyle,
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
        top: 61.0,
        right: 12.0,
      ),
      child: Container(
        height: 60.0,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
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
                      context.read<SearchPageBloc>().add(
                            LoadSearchPageEvent(
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
