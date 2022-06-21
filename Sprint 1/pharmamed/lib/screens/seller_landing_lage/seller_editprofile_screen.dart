import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/seller_profile/seller_profileViewModel.dart';
import 'package:stacked/stacked.dart';
//import 'package:cloud_firestore/cloud_firestore.dart'

class SellerProfile extends StatefulWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SellerProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(child: EditSellerProfileBody.body(context, model)),
      ),
      viewModelBuilder: () => SellerProfileViewModel(),
    );
  }
}

class EditSellerProfileBody {
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
            fnameText(),
            fnameInput(),
            unameText(),
            unameInput(),
            phoneText(),
            phoneInput(),
            saveButton(context, model),
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
          'Edit Profile Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
          'You may enter your new profile details.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  static Widget fnameText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Full Name:'),
      ),
    );
  }

  static Widget fnameInput() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Insert new full name here',
          hintStyle: TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.only(bottom: 8, left: 15, top: 8),
        ),
      ),
      //   controller: SellerProfile.fnameController,
      //   onChanged: (value) {},
      //),
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

  static Widget unameInput() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Insert new username here',
          hintStyle: TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.only(bottom: 8, left: 15, top: 8),
        ),
      ),
      //   controller: SellerProfile.unameController,
      //   onChanged: (value) {},
      //),
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

  static Widget phoneInput() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Insert new phone number here',
          hintStyle: TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.only(bottom: 8, left: 15, top: 8),
        ),
      ),
      //   controller: SellerProfile.phoneController,
      //   onChanged: (value) {},
      //),
    );
  }

  static Widget saveButton(BuildContext context, SellerProfile model) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          // model.update(context);
        },
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white, primary: HexColor('#0D5F96')),
        child: const Text('SAVE CHANGES'),
      ),
    );
  }
}
