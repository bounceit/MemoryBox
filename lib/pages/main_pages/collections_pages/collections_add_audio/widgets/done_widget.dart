import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/repositories/audio_firebase_repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../repositories/auth_repository.dart';

class DoneWidget extends StatefulWidget {
  const DoneWidget({
    Key? key,
    required this.id,
    required this.done,
    required this.collection,
    required this.titleCollections,
  }) : super(key: key);
  final String id;
  final String titleCollections;
  final List collection;
  final bool? done;

  @override
  State<DoneWidget> createState() => _DoneWidgetState();
}

class _DoneWidgetState extends State<DoneWidget> {
  bool _done = false;
  String? idCollection;

  Future<void> _getIdCollection(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection(AuthRepositories.instance.user!.phoneNumber!)
        .doc('id')
        .collection('CollectionsTale')
        .where('titleCollections', isEqualTo: widget.titleCollections)
        .get()
        .then((querySnapshot) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> result
          in querySnapshot.docs) {
        idCollection = result.data()['id'];
      }
    });
  }

  Future<void> _onTapDone(BuildContext context) async {
    _done = !_done;
    if (!_done) {
      await _getIdCollection(context);
      await AudioRepositories.instance.addAudioCollections(
        idCollection!,
        widget.id,
        widget.collection,
        false,
      );
      AudioRepositories.instance.doneAudioItem(
        widget.id,
        false,
        'Collections',
      );
      setState(() {});
    }
    if (_done) {
      // ignore: use_build_context_synchronously
      await _getIdCollection(context);
      await AudioRepositories.instance.addAudioCollections(
          idCollection!, widget.id, widget.collection, true);
      AudioRepositories.instance.doneAudioItem(
        widget.id,
        true,
        'Collections',
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => _onTapDone(context),
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.colorText,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.done,
                  color: _done ? AppColors.colorText : AppColors.colorAppbar,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
