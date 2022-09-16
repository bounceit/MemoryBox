import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_page/bloc/profile_bloc.dart';
import 'package:audio_fairy_tales/widgets/uncategorized/container_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/constants.dart';

class NameAndNumber extends StatelessWidget {
  const NameAndNumber({Key? key, required this.screenWidth}) : super(key: key);
  final double? screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Text(
              '${state.name}',
              style: bodyTextStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            ContainerShadow(
              image: const Text(''),
              width: screenWidth!,
              height: 60.0,
              radius: 50.0,
              widget: Text(
                '${state.number}',
              ),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        );
      },
    );
  }
}
