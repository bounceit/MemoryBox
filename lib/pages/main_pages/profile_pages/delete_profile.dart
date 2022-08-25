import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../repositories/preferences_data_user_rep.dart';
import '../../../repositories/user_repositories.dart';

class DeleteAccount extends StatelessWidget {
  DeleteAccount({Key? key}) : super(key: key);
  final DataModel model = DataModel();
  final _auth = FirebaseAuth.instance;
  final UserRepositories _rep = UserRepositories();

  void _deleteAccount(BuildContext context) {
    Navigator.pop(context);
    _rep.deleteAccount();
    PreferencesDataUser().cleanKey();
    _auth.signOut();
    Phoenix.rebirth(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            'Tочно удалить аккаунт?',
            style: TextStyle(color: AppColors.colorText, fontSize: 20.0),
          ),
          content: const Text(
            'Все аудиофайлы исчезнут и восстановить аккаунт будет невозможно',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.colorText50, fontSize: 14.0),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => _deleteAccount(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.pink),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: const BorderSide(
                      color: AppColors.pink,
                    ),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Text(
                  'Удалить',
                  style: TextStyle(color: Colors.white),
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
      ),
      child: const Text(
        'Удалить аккаунт',
        style: TextStyle(
          fontSize: 14.0,
          color: AppColors.pink,
        ),
      ),
    );
  }
}
