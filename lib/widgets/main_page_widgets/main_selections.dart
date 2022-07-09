<<<<<<< Updated upstream
=======
import 'package:audio_fairy_tales/recursec/app_colors.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';

class SelectionOne extends StatelessWidget {
  const SelectionOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
<<<<<<< Updated upstream
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(113, 165, 159, 0.8)),
      height: 210,
      width: 150,
      child: const Text('111'),
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(241, 180, 136, 0.8)),
      height: 100,
      width: 50,
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(103, 139, 210, 0.8)),
      height: 100,
      width: 200,
=======
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
>>>>>>> Stashed changes
    );
  }
}
