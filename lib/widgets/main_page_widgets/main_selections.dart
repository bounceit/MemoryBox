import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

class SelectionOne extends StatelessWidget {
  const SelectionOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.green100),
      height: 250,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Здесь будет твой набор сказок',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white100,
                fontFamily: 'TTNorms',
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Добавить ',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white100,
              fontFamily: 'TTNorms',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectionTwo extends StatelessWidget {
  const SelectionTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.pinkRec),
      height: 110,
      width: 200,
      alignment: AlignmentDirectional.center,
      child: const Text(
        'Тут',
        style: TextStyle(
          color: AppColors.white100,
          fontFamily: 'TTNorms',
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}

class SelectoinThree extends StatelessWidget {
  const SelectoinThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.blue200),
      height: 110,
      width: 200,
      alignment: AlignmentDirectional.center,
      child: const Text(
        'И тут ',
        style: TextStyle(
          color: AppColors.white100,
          fontFamily: 'TTNorms',
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}
