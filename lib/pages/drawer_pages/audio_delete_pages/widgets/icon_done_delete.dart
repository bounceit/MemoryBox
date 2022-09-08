import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../repositories/audio_firebase_repositories.dart';

class IconDoneDelete extends StatefulWidget {
  const IconDoneDelete({
    Key? key,
    required this.id,
    required this.done,
  }) : super(key: key);
  final String? id;
  final bool? done;

  @override
  State<IconDoneDelete> createState() => _IconDoneDeleteState();
}

class _IconDoneDeleteState extends State<IconDoneDelete> {
  bool _done = false;

  Future<void> _onTapDone() async {
    _done = !_done;
    if (_done) {
      AudioRepositories.instance.doneAudioItem(
        widget.id!,
        true,
        'DeleteCollections',
      );
      setState(() {});
    }
    if (!_done) {
      AudioRepositories.instance.doneAudioItem(
        widget.id!,
        false,
        'DeleteCollections',
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
            onTap: () => _onTapDone(),
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
                  color: widget.done! ? AppColors.colorText : AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
