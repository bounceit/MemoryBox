import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_edit/profile_edit_page_model.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../recursec/app_icons.dart';
import '../../../../widgets/buttons/icon_camera.dart';

class PhotoProfileEdit extends StatelessWidget {
  const PhotoProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final singleImage = context.watch<ProfileEditPageModel>().getSingleImage;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: singleImage != null && singleImage.isNotEmpty
                    ? ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.network(
                          singleImage,
                          fit: BoxFit.cover,
                        ))
                    : ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.asset(
                          AppIcons.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: IconCamera(
            colorBorder: Colors.white,
            onTap: () async =>
                await Provider.of<ProfileEditPageModel>(context, listen: false)
                    .onTapPhoto(context),
            color: AppColors.black50,
            position: 0.0,
          ),
        )
      ],
    );
  }
}
