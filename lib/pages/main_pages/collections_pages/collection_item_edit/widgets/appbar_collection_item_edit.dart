import 'package:audio_fairy_tales/widgets/uncategorized/custom_shape.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item_edit/blocs/get_image_cubit/get_image_cubit.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../repositories/collections_repositories.dart';
import '../../../../../utils/constants.dart';
import '../../../../../widgets/buttons/icon_back.dart';
import '../../collections/collections.dart';
import '../blocs/collection_item_edit/collection_item_edit_bloc.dart';

class AppbarHeaderCollectionItemEdit extends StatefulWidget {
  const AppbarHeaderCollectionItemEdit({
    Key? key,
    required this.idCollection,
    required this.titleCollection,
    required this.subTitleCollection,
    required this.imageCollection,
  }) : super(key: key);
  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;
  final String imageCollection;

  @override
  State<AppbarHeaderCollectionItemEdit> createState() =>
      AppbarHeaderCollectionItemEditState();
}

class AppbarHeaderCollectionItemEditState
    extends State<AppbarHeaderCollectionItemEdit> {
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    _controller.text = widget.titleCollection;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _editCollections(
    BuildContext context,
    state,
    stateImage,
  ) {
    CollectionsRepositories.instance.updateCollection(
      widget.idCollection,
      state.title ?? widget.titleCollection,
      state.subTitle ?? widget.subTitleCollection,
      stateImage.image ?? widget.imageCollection,
    );
    Navigator.pushNamed(
      context,
      Collections.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionItemEditBloc, CollectionItemEditState>(
      builder: (_, state) {
        return BlocBuilder<GetImageCollectionItemEditCubit,
            GetImageCollectionItemEditState>(
          builder: (_, stateImage) {
            return Stack(
              children: [
                Container(),
                ClipPath(
                  clipper: Customshape(),
                  child: Container(
                    color: AppColors.colorAppbar2,
                    width: double.infinity,
                    height: 280.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 27.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBack(
                        onPressed: () => _editCollections(
                          context,
                          state,
                          stateImage,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Отменить',
                          style: threeTitleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90.0,
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: TextField(
                    autofocus: true,
                    controller: _controller,
                    onChanged: (titleCollectionsEdit) {
                      context.read<CollectionItemEditBloc>().add(
                            CollectionItemEditEvent(
                              title: titleCollectionsEdit,
                            ),
                          );
                    },
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: AppColors.white100,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
