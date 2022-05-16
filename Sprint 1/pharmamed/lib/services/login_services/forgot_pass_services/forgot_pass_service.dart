import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmamed/screens/reset_password_page/forgot_pass_viewmodel.dart';

abstract class ForgotPassService {
  static Future resetPass() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: ForgotPassViewModel.resetPassEmailController.text.trim());
    } on FirebaseAuthException catch (e) {
      String error = e.toString();
      Fluttertoast.showToast(
          msg: error,
          gravity: ToastGravity.CENTER,
          fontSize: 20,
          timeInSecForIosWeb: 120);
    }
  }
}
