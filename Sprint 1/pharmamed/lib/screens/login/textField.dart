// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Body {
  static final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: HexColor('#0D5F96'),
    minimumSize: const Size(120, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static Widget txtField() {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Email'),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ))
        ],
      ),
    );
  }

  static Widget headerTxt() {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Login',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static Widget instructionTxt() {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Please login to continue',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  static Widget button() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 18),
          )),
    );
  }

  static Widget forgotPassText() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Forgot Your Password?",
              style: const TextStyle(color: Colors.lightBlueAccent),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  // launchUrl();
                })
        ]),
      ),
    );
  }

  static Widget signupText() {
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 30),
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
              text: "Don't have an account?",
              style: TextStyle(color: Colors.black)),
          TextSpan(
              text: "Sign Up",
              style: TextStyle(
                  color: HexColor('#0D5F96'), fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  // launchUrl();
                })
        ]),
      ),
    );
  }
}
