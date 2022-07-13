import 'package:flutter/material.dart';

import '../../recursec/app_colors.dart';

class AudioStackWidget extends StatelessWidget {
  const AudioStackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset.fromDirection(1),
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
          color: AppColors.white100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Аудиозаписи',
                    style: TextStyle(
                      color: Color.fromRGBO(58, 58, 85, 1),
                      fontFamily: 'TTNorms',
                      fontSize: 24,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Открыть все',
                    style: TextStyle(
                      color: Color.fromRGBO(58, 58, 85, 1),
                      fontFamily: 'TTNorms',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: const [
                AudioList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AudioList extends StatelessWidget {
  const AudioList({Key? key}) : super(key: key);
  final AudioRepositories repositories = AudioRepositories();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 75),
          Text(
            'Как только ты запишешь \n аудио, она появится здесь.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'TTNorms',
              fontSize: 20.0,
              color: AppColors.colorText.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 50),
          Icon(
            Icons.arrow_downward,
            size: 50,
            color: AppColors.colorText.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
