import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/login/login_Screen.dart';
import 'package:pharmamed/screens/login/login_body.dart';
import 'package:pharmamed/screens/reset_password_page/forgot_pass_viewmodel.dart';

class ForgotPassBody {
  static Widget text() {
    return Column(
      children: const [
        Icon(
          Icons.key,
          size: 120,
          color: Colors.black54,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 5),
          child: Text("Forgot Password?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
        ),
        Text(
          "Receive an email to reset your password",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  static Widget emailEntry() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 30),
      child: TextField(
        decoration: const InputDecoration(hintText: "Email"),
        controller: ForgotPassViewModel.resetPassEmailController,
      ),
    );
  }

  static Widget button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ElevatedButton(
        onPressed: () {
          ForgotPassViewModel.resetPassword(context);
        },
        child: const Text("Reset Password"),
        style: LoginBody.raisedButtonStyle,
      ),
    );
  }

  static Widget loginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 30),
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
              text: "I already have an account?",
              style: TextStyle(color: Colors.black)),
          TextSpan(
              text: "Log In",
              style: TextStyle(
                  color: HexColor('#0D5F96'), fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                })
        ]),
      ),
    );
  }
}
