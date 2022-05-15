// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/models/users.dart';
import 'package:pharmamed/screens/buyer_landing_page/buyer_landing_screen.dart';
import 'package:pharmamed/screens/seller_landing_lage/seller_landing_screen.dart';
import 'package:pharmamed/services/login_services/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginViewModel {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  static void login(BuildContext context) async {
    await LoginService.signIn();
    // roleDetector(context);
    // await FirebaseAuth.instance.authStateChanges();
    const MyApp();
  }

  static void roleDetector(BuildContext context) async {
    final String user = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance.doc('user/$user').get();
    final users = Users.fromJson(doc.data()!);

    if (users.role == "buyer") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BuyerLandingPage(),
          ));
      // Routers.route(Routers.buyerLandingPath, context);
    } else if (users.role == "seller") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SellerLandingPage(),
          ));
    }
  }
}
