import 'package:flutter/material.dart';
import 'custom_shape.dart';
import '../register_pages_widgets/register_text_widget.dart';

class RegisterClipPath extends StatelessWidget {
  const RegisterClipPath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Customshape(),
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(140, 132, 226, 1),
        child: const Center(
          child: TextRegister(),
        ),
      ),
    );
  }
}
