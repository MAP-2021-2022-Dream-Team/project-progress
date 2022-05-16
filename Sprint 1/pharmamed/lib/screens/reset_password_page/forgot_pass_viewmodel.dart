import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/services/login_services/forgot_pass_services/forgot_pass_service.dart';

class ForgotPassViewModel {
  static final resetPassEmailController = TextEditingController();

  static void resetPassword(BuildContext context) {
    ForgotPassService.resetPass();

    Fluttertoast.showToast(
        msg: "Password Reset Email Sent",
        gravity: ToastGravity.CENTER,
        fontSize: 20,
        timeInSecForIosWeb: 30);

    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
}
