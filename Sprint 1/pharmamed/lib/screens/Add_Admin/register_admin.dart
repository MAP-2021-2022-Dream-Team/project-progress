import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/screens/Add_Admin/admin_ViewModel.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class AddAdmins {
  static Future<String> add() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: AddAdmin.emailController.text.trim(),
              password: AddAdmin.passwordController.text.trim())
          .then((value) async {
        User admin = FirebaseAuth.instance.currentUser!;

        await FirebaseFirestore.instance
            .collection("admin")
            .doc(admin.uid)
            .set({
          "fname": AddAdmin.nameController.text.trim(),
          "uname": AddAdmin.usernameController.text.trim(),
          "phone": AddAdmin.phoneNumController.text.trim(),
          "role": "buyer",
        });
      });

      Fluttertoast.showToast(
          msg: "Success",
          gravity: ToastGravity.CENTER,
          fontSize: 25,
          backgroundColor: Colors.greenAccent,
          timeInSecForIosWeb: 30000);
      return "Successful Added";
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
