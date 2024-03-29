import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/services/login_services/forgot_pass_services/forgot_pass_service.dart';

import 'package:stacked/stacked.dart';

class ForgotPassViewModel extends BaseViewModel {
  static final resetPassEmailController = TextEditingController();

  ForgotPassService forgotPassService = locator<ForgotPassService>();

  void resetPassword(BuildContext context) {
    // ForgotPassService.resetPass();
    forgotPassService.resetPass();

    Fluttertoast.showToast(
        msg: "Password Reset Email Sent",
        gravity: ToastGravity.CENTER,
        fontSize: 20,
        timeInSecForIosWeb: 30);

    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
}
