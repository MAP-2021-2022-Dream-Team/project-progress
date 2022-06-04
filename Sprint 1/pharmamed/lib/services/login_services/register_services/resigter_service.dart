import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/screens/register/register_viewModel.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class RegisterService {
  static Future<String> signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: RegisterViewModel.emailController.text.trim(),
              password: RegisterViewModel.passwordController.text.trim())
          .then((value) async {
        User user = FirebaseAuth.instance.currentUser!;

        await FirebaseFirestore.instance.collection("user").doc(user.uid).set({
          "fname": RegisterViewModel.nameController.text.trim(),
          "uname": RegisterViewModel.usernameController.text.trim(),
          "phone": RegisterViewModel.phoneNumController.text.trim(),
          "role": "buyer",
        });
      });

      Fluttertoast.showToast(
          msg: "Successful SignUp",
          gravity: ToastGravity.CENTER,
          fontSize: 25,
          backgroundColor: Colors.greenAccent,
          timeInSecForIosWeb: 30000);
      return "Successful SignUp";
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          gravity: ToastGravity.CENTER,
          fontSize: 25,
          backgroundColor: Colors.redAccent,
          timeInSecForIosWeb: 30000);
      return e.toString();
    }
  }
}
