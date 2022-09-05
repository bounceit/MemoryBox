import 'dart:async';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/repositories/user_repositories.dart';
import 'package:flutter/material.dart';

import '../../pages/main_pages/collections_pages/collections_repository.dart';
import '../../recursec/app_icons.dart';

class AlertDialogApp {
  AlertDialogApp({Key? key});
  final CollectionsRepositories repositoriesCollection =
      CollectionsRepositories();
  void alertDone(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          Timer(const Duration(seconds: 1), () async {
            await UserRepositories().updateTotalTimeQuality();
            Navigator.pop(context);
          });
          return AlertDialog(
            insetPadding: const EdgeInsets.all(75.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            content: Image.asset(
              AppIcons.tick,
              width: 175.0,
              height: 175.0,
            ),
          );
        });
  }

  void alertDialog(
    BuildContext context,
    String idAudio,
    String inCollection,
    String fromCollection,
  ) =>
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            'Подтверждаете удаление?',
            style: TextStyle(color: AppColors.pink, fontSize: 18.0),
          ),
          content: const Text(
            'Ваш файл перенесется в папку “Недавно удаленные”. Через 15 дней он исчезнет.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.colorText70, fontSize: 14.0),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  alertDone(context);
                  await repositoriesCollection.copyPastCollections(
                    idAudio,
                    fromCollection,
                    inCollection,
                  );
                  await repositoriesCollection.deleteCollection(
                      idAudio, fromCollection);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.colorAppbar),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                        color: AppColors.colorAppbar,
                      ),
                    ),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  child: Text(
                    'Да',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.white100),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                        color: AppColors.blue300,
                      ),
                    ),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    'Нет',
                    style: TextStyle(color: AppColors.colorText),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
