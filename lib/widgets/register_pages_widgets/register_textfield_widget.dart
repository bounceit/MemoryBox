import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../recursec/app_colors.dart';

class DecorationOfTextField extends StatelessWidget {
  const DecorationOfTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white100,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(1),
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'TT Norms',
          fontWeight: FontWeight.w400,
        ),
        inputFormatters: [MaskedInputFormatter('+### (##) ### ## ##')],
        autocorrect: false,
        showCursor: false,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)),
          fillColor: const Color.fromRGBO(246, 246, 246, 1),
        ),
      ),
    );
  }
}









// class PhoneInputFormater extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
//     final digitsOnlyChars = digitsOnly.split('');
//     var newString = <String>[];
//     for (var i = 0; i < digitsOnlyChars.length; i++) {
//       if (i == 3 || i == 6 || i == 8) {
//         newString.add(' ');
//         newString.add(digitsOnlyChars[i]);
//       } else {
//         newString.add(digitsOnlyChars[i]);
//       }
//     }
//     final resultString = digitsOnlyChars.join('');

//     return TextEditingValue(
//         text: resultString,
//         selection: TextSelection.collapsed(offset: resultString.length));
//   }
// }
