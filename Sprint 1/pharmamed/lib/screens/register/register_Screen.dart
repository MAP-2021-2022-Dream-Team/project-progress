// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/login/login_Screen.dart';
import 'package:pharmamed/screens/register/register_viewModel.dart';
import 'package:stacked/stacked.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: RegisterBody.body(context, model),
        backgroundColor: HexColor('#EBF7FF'),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
    //return Scaffold(
    //body: const Body(),
    //backgroundColor: HexColor('#EBF7FF'),
    //);
  }
}

class RegisterBody {
  static Widget body(BuildContext context, RegisterViewModel model) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            headerTxt(),
            txt(),
            nameText(),
            nameInput(),
            emailText(),
            emailInput(),
            numText(),
            numInput(),
            usrText(),
            usrInput(),
            pswText(),
            pswInput(),
            regButton(context, model),
            accCheck(context),
          ],
        ),
      ),
    );
  }

  static Widget headerTxt() {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static Widget txt() {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 50),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Fill up the following details to register.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  static Widget nameText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Full Name',
        ),
      ),
    );
  }

  static Widget nameInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Insert name here',
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 8, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          controller: RegisterViewModel.nameController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget emailText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Email',
        ),
      ),
    );
  }

  static Widget emailInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Insert email here',
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 8, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          controller: RegisterViewModel.emailController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget numText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Phone Number',
        ),
      ),
    );
  }

  static Widget numInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Insert phone number here',
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 8, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          controller: RegisterViewModel.phoneNumController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget usrText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Username',
        ),
      ),
    );
  }

  static Widget usrInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Insert username here',
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 8, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          controller: RegisterViewModel.usernameController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget pswText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Password',
        ),
      ),
    );
  }

  static Widget pswInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Insert password here',
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 8, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          controller: RegisterViewModel.passwordController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget regButton(BuildContext context, RegisterViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          model.register(context);
        },
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white, primary: HexColor('#0D5F96')),
        child: const Text('SIGN UP'),
      ),
    );
  }

  static Widget accCheck(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Already have an account?',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: ' Sign In',
              style: const TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Login(),
                    ),
                  );
                },
            )
          ],
        ),
      ),
    );
  }
}
