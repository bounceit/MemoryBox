import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoProfileProfile extends StatelessWidget {
  const PhotoProfileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _image = context.watch<DataModel>().getUserImage!;
    return Column(
      children: [
        const Text(
          'Твоя частичка',
          style: threeTitleTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.asset(
                          _image,
                          fit: BoxFit.cover,
                        ))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
