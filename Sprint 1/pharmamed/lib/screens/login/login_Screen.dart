// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/login/login_body.dart';

import 'package:stacked/stacked.dart';

import 'login_viewModel.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: HexColor('#EBF7FF'),
        body: LoginBody.body(context, model),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
