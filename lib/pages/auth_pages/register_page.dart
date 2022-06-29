import 'package:audio_fairy_tales/pages/auth_pages/last_register_page.dart';
import 'package:audio_fairy_tales/pages/auth_pages/widgets/text_field_captcha.dart';
import 'package:audio_fairy_tales/pages/uncategorized/splash_screen.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import '../../widgets/buttons/register_button.dart';
import '../../widgets/register_pages_widgets/register_box_widget.dart';
import '../../widgets/register_pages_widgets/register_button_widget.dart';
import '../../widgets/register_pages_widgets/register_text_widget.dart';
import '../../widgets/register_pages_widgets/register_textfield_widget.dart';
import '../../widgets/uncategorized/main_register_clip_path.dart';
import '../main_pages/main_of_main.dart';

enum PhoneVerificationState {
  mobileFormState,
  showOtpFormState,
}

class RegisterPage extends StatefulWidget {
  static const routeName = '/register_page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  PhoneVerificationState currentState = PhoneVerificationState.mobileFormState;

  final _phoneController = TextEditingController();

  final _otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? verificationId;
  bool isShowLoading = false;

  void _singInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isShowLoading = true;
    });
    try {
      final authCredentical =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        isShowLoading = false;
        if (authCredentical.user != null) {
          Navigator.pushNamed(context, LastPageRegister.routeName);
        }
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isShowLoading = false;
      });
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    }
  }

  _getMobileFormWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AddNumberText(),
        const SizedBox(height: 15),
        PhoneInputField(phoneController: _phoneController),
        const SizedBox(height: 50),
        ElevatedButton(
            onPressed: () async {
              setState(() {
                isShowLoading = true;
              });
              await _auth.verifyPhoneNumber(
                phoneNumber: _phoneController.text,
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    isShowLoading = false;
                  });
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    isShowLoading = false;
                  });
                  _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(verificationFailed.message!),
                    ),
                  );
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    isShowLoading = false;
                    currentState = PhoneVerificationState.showOtpFormState;
                    this.verificationId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
              );
            },
            style: buttonRegisterStyle,
            child: const RegisterButtonText()),
      ],
    );
  }

  _getOtpFormWidget(context) {
    return Column(
      children: [
        const Text(
          'Введи код из смс, чтобы мы \n тебя запомнили',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFieldCaptcha(
          controller: _otpController,
        ),
        const SizedBox(
          height: 30.0,
        ),
        ElevatedButton(
            onPressed: () {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId!,
                      smsCode: _otpController.text);
              _singInWithPhoneAuthCredential(phoneAuthCredential);
            },
            style: buttonRegisterStyle,
            child: const RegisterButtonText()),
      ],
    );
  }

  void _nextPage() {
    Navigator.pushReplacementNamed(context, Main.routeName);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  const SizedBox(height: 15),
                  isShowLoading
                      ? const CircularProgressIndicator()
                      : currentState == PhoneVerificationState.mobileFormState
                          ? _getMobileFormWidget(context)
                          : _getOtpFormWidget(context),
                  SizedBox(height: 16),
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
    );
  }
}

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    Key? key,
    required TextEditingController phoneController,
  })  : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;

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
        controller: _phoneController,
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
