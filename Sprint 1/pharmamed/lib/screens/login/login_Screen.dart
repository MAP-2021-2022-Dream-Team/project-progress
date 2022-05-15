// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/app/route.dart';
import 'package:pharmamed/screens/login/login_body.dart';
import 'package:pharmamed/screens/login/login_viewModel.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginBody.headerTxt(),
          LoginBody.instructionTxt(),
          LoginBody.txtField(),
          LoginBody.forgotPassText(),
          LoginBody.button(context),
          LoginBody.signupText(),
        ],
      ),
    );
  }
}
