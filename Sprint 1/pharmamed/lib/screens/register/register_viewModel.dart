// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/screens/register/register_Screen.dart';
import 'package:pharmamed/services/login_services/register_services/resigter_service.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneNumController = TextEditingController();
  static final usernameController = TextEditingController();
  static final passwordController = TextEditingController();
  String feedback = "";

  RegisterService registerService = locator<RegisterService>();

  void register(BuildContext context) async {
    // RegisterService.signUp();
    registerService.signUp(feedback);

    // if (feedback == "Successful SignUp") {
    //   RegisterBody.succesfulToast(feedback);
    // } else {
    //   RegisterBody.errorToast(feedback);
    // }

    const MyApp();
  }
}
