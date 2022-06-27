import 'package:flutter/material.dart';

class DecorationOfTextField extends StatelessWidget {
  DecorationOfTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
