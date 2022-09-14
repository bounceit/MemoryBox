import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../repositories/audio_firebase_repositories.dart';
import '../../../../../repositories/collections_repositories.dart';

// ignore: must_be_immutable
class ModelAudioCollectionAddAudioInCollection extends StatefulWidget {
  ModelAudioCollectionAddAudioInCollection({
    Key? key,
    this.title,
    this.quality,
    this.image,
    this.subTitle,
    this.data,
    this.doneCollection,
    this.id,
    this.totalTime,
    required this.collectionAudio,
    required this.idAudio,
  }) : super(key: key);
  final String? id;
  final String? title;
  final String? subTitle;
  final String? quality;
  final String? image;
  final String? data;
  final String? totalTime;
  final List collectionAudio;
  final String idAudio;
  bool? doneCollection = false;

  @override
  State<ModelAudioCollectionAddAudioInCollection> createState() =>
      _ModelAudioCollectionAddAudioInCollectionState();
}

class _ModelAudioCollectionAddAudioInCollectionState
    extends State<ModelAudioCollectionAddAudioInCollection> {
  final bool done = true;
  @override
  void initState() {
    final List collectionAudio = widget.collectionAudio;
    collectionAudio.contains(widget.id)
        ? CollectionsRepositories.instance.doneCollections(
            widget.id!,
            true,
          )
        : CollectionsRepositories.instance.doneCollections(
            widget.id!,
            false,
          );
    super.initState();
  }

  Future<void> _onPressedDone(BuildContext context) async {
    widget.doneCollection = !widget.doneCollection!;
    if (!widget.doneCollection!) {
      await CollectionsRepositories.instance.doneCollections(
        widget.id!,
        false,
      );
      await AudioRepositories.instance.addAudioCollections(
        widget.id!,
        widget.idAudio,
        widget.collectionAudio,
        false,
      );
      await CollectionsRepositories.instance.updateQualityAndTotalTime(
        widget.id!,
      );
    }
    if (widget.doneCollection!) {
      await CollectionsRepositories.instance.doneCollections(
        widget.id!,
        true,
      );
      await AudioRepositories.instance.addAudioCollections(
        widget.id!,
        widget.idAudio,
        widget.collectionAudio,
        true,
      );
      await CollectionsRepositories.instance.updateQualityAndTotalTime(
        widget.id!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      child: Container(
        width: 185.0,
        height: 250.0,
        color: Colors.grey,
        child: Stack(
          children: [
            widget.image != ''
                ? Image.network(
                    widget.image!,
                    fit: BoxFit.fill,
                    width: 185.0,
                    height: 250.0,
                  )
                : Container(
                    width: 185.0,
                    height: 250.0,
                    color: Colors.grey,
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 5,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 10,
                    child: Text(
                      widget.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white100,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.quality} аудио',
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white100,
                          ),
                        ),
                        Text(
                          '${widget.totalTime} часа',
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white100,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 185.0,
              height: 250.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                gradient: LinearGradient(
                    colors: widget.doneCollection!
                        ? [
                            const Color(0xFF000000),
                            const Color(0xFF000000),
                          ]
                        : [
                            const Color(0xFF000000),
                            const Color(0xFF454545),
                          ],
                    begin: Alignment.bottomRight),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _onPressedDone(context),
                    icon: Icon(
                      Icons.done,
                      color: widget.doneCollection!
                          ? AppColors.white
                          : AppColors.green100,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
