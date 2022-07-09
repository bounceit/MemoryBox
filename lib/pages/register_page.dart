import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/buttons/register_button.dart';
import '../widgets/register_pages_widgets/register_box_widget.dart';
import '../widgets/register_pages_widgets/register_button_widget.dart';
import '../widgets/register_pages_widgets/register_text_widget.dart';
import '../widgets/register_pages_widgets/register_textfield_widget.dart';
import '../widgets/uncategorized/main_register_clip_path.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void _nextPage() {
    Navigator.of(context).pushReplacementNamed('/main_page');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.white100,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RegisterClipPath(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AddNumberText(),
                    const SizedBox(height: 15),
                    const DecorationOfTextField(),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () {},
                        style: buttonRegisterStyle,
                        child: const RegisterButtonText()),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        _nextPage();
                      },
                      child: const LetterText(),
                    ),
                    const SizedBox(height: 25),
                    const AboutRegisterWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
