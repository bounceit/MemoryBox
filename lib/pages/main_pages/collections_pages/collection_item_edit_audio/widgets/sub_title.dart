import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';

class SubTitle extends StatefulWidget {
  const SubTitle({
    Key? key,
    required this.subTitleCollection,
  }) : super(key: key);
  final String subTitleCollection;

  @override
  State<SubTitle> createState() => _SubTitleState();
}

class _SubTitleState extends State<SubTitle> {
  bool allText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ),
          child: Text(widget.subTitleCollection,
              style: twoBodyTextStyle,
              maxLines: allText ? 4 : 100,
              overflow: TextOverflow.ellipsis),
        ),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              allText = !allText;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                allText ? 'Подробнее' : 'Скрить...',
                style: const TextStyle(
                  color: AppColors.colorText50,
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
