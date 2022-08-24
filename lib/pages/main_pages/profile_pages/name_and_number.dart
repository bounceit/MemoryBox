import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../recursec/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/container_shadow.dart';

class NameAndNumber extends StatelessWidget {
  const NameAndNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Text(
          '${context.watch<DataModel>().getName}',
          style: bodyTextStyle,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          width: 350.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: AppColors.white100,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                offset: Offset.fromDirection(1),
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${context.watch<DataModel>().getNumber}',
              style: linkColorText,
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
