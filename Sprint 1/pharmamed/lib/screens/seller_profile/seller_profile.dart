import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/seller_profile/seller_profileViewModel.dart';
import 'package:stacked/stacked.dart';

class SellerProfile extends StatefulWidget {
  SellerProfile({Key? key}) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SellerProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Seller Profile'),
        ),
        body: SellerProfileBody.body(context, model),
      ),
      viewModelBuilder: () => SellerProfileViewModel(),
    );
  }
}

class SellerProfileBody {
  static Widget body(BuildContext context, SellerProfileViewModel model) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header(),
            txt(),
            unameField(),
            //emailField(),
            //pNumField(),
          ],
        ),
      ),
    );
  }

  static Widget header() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'View Profile Details',
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
          'Below are your profile details.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  static Widget unameText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Username: '),
      ),
    );
  }

  static Widget unameField() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      //child: Align(
      //alignment: Alignment.centerLeft,
      //child: model.getProfileDetails().uname,
      //style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      //),
    );
  }

  static Widget fnameText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('First Name: '),
      ),
    );
  }

  static Widget emailText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Email: '),
      ),
    );
  }

  static Widget phoneText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Phone Number: '),
      ),
    );
  }
}
