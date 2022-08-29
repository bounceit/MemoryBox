import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit_model.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/buttons/icon_camera.dart';
import '../../../widgets/container_shadow.dart';

class PhotoContainer extends StatefulWidget {
  const PhotoContainer({Key? key}) : super(key: key);

  @override
  State<PhotoContainer> createState() => _PhotoContainerState();
}

class _PhotoContainerState extends State<PhotoContainer> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final singleImage = context.watch<CollectionsEditModel>().getSingleImage;
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        top: 150.0,
        right: 15.0,
      ),
      child: ContainerShadow(
        image: singleImage != null
            ? Image.network(
                singleImage,
                fit: BoxFit.fitWidth,
              )
            : const Text(''),
        width: screenWidth * 0.955,
        height: 200.0,
        widget: IconCamera(
          color: AppColors.green100,
          // onTap: () => _imagePickPhoto(context),
          onTap: () => Provider.of<CollectionsEditModel>(context, listen: false)
              .imagePickPhoto(context),
          colorBorder: AppColors.colorText80,
          position: 0.0,
        ),
        radius: 20.0,
      ),
    );
  }
}
