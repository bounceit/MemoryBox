import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoProfileProfile extends StatelessWidget {
  const PhotoProfileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? image = context.watch<DataModel>().getUserImage!;
    return Column(
      children: [
        Text(
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
                        child: image == 'assets/images/profile_avatar.png'
                            ? Image.asset(
                                image,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                context.watch<DataModel>().getUserImage!,
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
