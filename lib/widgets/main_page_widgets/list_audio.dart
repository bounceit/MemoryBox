import 'package:flutter/material.dart';

import '../../recursec/app_colors.dart';

class Audio {
  Audio({
    required this.audioName,
    required this.time,
  });
  final String audioName;
  final String time;
}

class ListAudio extends StatelessWidget {
  ListAudio({
    Key? key,
  }) : super(key: key);
  final _audios = [
    Audio(
      audioName: 'Малышь коки',
      time: '30 минут',
    ),
    Audio(
      audioName: 'Малышь коки1',
      time: '30 минут',
    ),
    Audio(
      audioName: 'Малышь коки2',
      time: '30 минут',
    ),
    Audio(
      audioName: 'Малышь коки3',
      time: '30 минут',
    ),
    Audio(
      audioName: 'Малышь коки4',
      time: '30 минут',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 35),
      itemCount: _audios.length,
      itemExtent: 75,
      itemBuilder: ((context, index) {
        final audio = _audios[index];
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white100,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image(
                      image: AssetImage('assets/icons/play.png'),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(audio.audioName),
                        const SizedBox(height: 10),
                        Text(audio.time)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        '...',
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
