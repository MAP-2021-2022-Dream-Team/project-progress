import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/reset_password_page/forgot_pass_body.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EBF7FF'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ForgotPassBody.text(),
          ForgotPassBody.emailEntry(),
          ForgotPassBody.button(context),
          ForgotPassBody.loginText(context)
        ],
      ),
    );
  }
}
