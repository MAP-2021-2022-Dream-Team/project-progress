// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
  static String feedback = "";

  void register(BuildContext context) async {
    RegisterService.signUp();

    if (feedback == "Successful SignUp") {
      RegisterBody.succesfulToast();
    } else {
      RegisterBody.errorToast();
    }

    const MyApp();
  }
}
