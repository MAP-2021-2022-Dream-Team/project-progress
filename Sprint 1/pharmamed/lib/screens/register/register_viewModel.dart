import 'package:flutter/material.dart';
import 'package:pharmamed/main.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmamed/models/users.dart';
import 'package:pharmamed/services/login_services/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterViewModel extends BaseViewModel {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneNumController = TextEditingController();
  static final usernameController = TextEditingController();
  static final passwordController = TextEditingController();

  void register(BuildContext context) {
    const MyApp();
  }
}
