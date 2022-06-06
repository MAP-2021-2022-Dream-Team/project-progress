// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/screens/Add_Admin/Admins.dart';
import 'package:pharmamed/screens/Add_Admin/Admin_Home.dart';
import 'package:pharmamed/screens/Add_Admin/admin_login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  void login(BuildContext context) async {
    await AdminLoginService.signIn();

    const MyApp();
  }

  static void roleDetector(BuildContext context) async {
    final String user = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance.doc('admin/$admins').get();
    final admin = admins.fromJson(doc.data()!);

    if (admin.role == "Admin") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminHome(),
          ));
    }
  }
}
