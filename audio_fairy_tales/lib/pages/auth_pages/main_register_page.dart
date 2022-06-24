import 'package:flutter/material.dart';
import '../../widgets/buttons/register_button.dart';
import '../../widgets/register_pages_widgets/register_button_widget.dart';
import '../../widgets/register_pages_widgets/register_text_widget.dart';
import '../../widgets/uncategorized/register_clip_path.dart';

class MainRegisterPage extends StatefulWidget {
  static const routeName = '/';
  static Widget create() {
    return const MainRegisterPage();
  }

  const MainRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainRegisterPage> createState() => _MainRegisterPage();
}

class _MainRegisterPage extends State<MainRegisterPage> {
  void _nextPage() {
    Navigator.of(context).pushReplacementNamed('/register_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ClipPathWidget(),
          const SizedBox(height: 25),
          const FirstText(),
          const SizedBox(height: 24),
          ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 300),
              child: const SecondText()),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => _nextPage(),
              style: buttonRegisterStyle,
              child: const RegisterButtonText()),
        ],
      ),
    );
  }
}
