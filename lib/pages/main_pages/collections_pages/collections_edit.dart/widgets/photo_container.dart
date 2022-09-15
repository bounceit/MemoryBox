import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/buttons/icon_camera.dart';
import '../../../../../widgets/uncategorized/container_shadow.dart';
import '../blocs/cubit_image_edit/get_image_cubit.dart';

class PhotoContainer extends StatefulWidget {
  const PhotoContainer({Key? key}) : super(key: key);

  @override
  State<PhotoContainer> createState() => _PhotoContainerState();
}

class _PhotoContainerState extends State<PhotoContainer> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<GetImageCubit, GetImageState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 150.0,
            right: 15.0,
          ),
          child: ContainerShadow(
            image: state.image != null
                ? Image.network(
                    '${state.image}',
                    fit: BoxFit.fitWidth,
                  )
                : const Text(''),
            width: screenWidth * 0.955,
            height: 200.0,
            widget: IconCamera(
              color: Colors.transparent,
              onTap: () => context.read<GetImageCubit>().getImage(),
              colorBorder: AppColors.white,
              position: 0.0,
            ),
            radius: 20.0,
          ),
        );
      },
    );
  }
}
