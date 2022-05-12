// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/login/textField.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EBF7FF'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Body.headerTxt(),
          Body.instructionTxt(),
          Body.txtField(),
          Body.forgotPassText(),
          Body.button(),
          Body.signupText()
        ],
      ),
    );
  }
}
