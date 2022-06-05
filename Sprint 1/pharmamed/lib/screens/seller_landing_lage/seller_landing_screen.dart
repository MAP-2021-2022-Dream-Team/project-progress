import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/login/login_Screen.dart';
import 'package:pharmamed/screens/view_All_Medicine_list/view_all_medicineList_screen.dart';

class SellerLandingPage extends StatefulWidget {
  const SellerLandingPage({Key? key}) : super(key: key);

  @override
  State<SellerLandingPage> createState() => _SellerLandingPageState();
}

class _SellerLandingPageState extends State<SellerLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EBF7FF'),
      appBar: AppBar(
        title: Text("Seller Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllMedicineListView()));
                },
                child: Text("All Available Medicine List")),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Sign Out")),
          ],
        ),
      ),
    );
  }
}
