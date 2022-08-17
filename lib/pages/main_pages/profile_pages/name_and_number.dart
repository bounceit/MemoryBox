import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ContainerShadow(
          image: const Text(''),
          width: 0.0,
          height: 60.0,
          radius: 50.0,
          widget: Text(
            '${context.watch<DataModel>().getNumber}',
          ),
        ),
        const SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
