import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/checkout/checkout_screen.dart';
import 'package:pharmamed/screens/login/login_Screen.dart';
import 'package:pharmamed/screens/search_medicine/search_medicine.dart';

import '../med_buyer/med_buyer.dart';

class BuyerLandingPage extends StatefulWidget {
  const BuyerLandingPage({Key? key}) : super(key: key);

  @override
  State<BuyerLandingPage> createState() => _BuyerLandingPageState();
}

class _BuyerLandingPageState extends State<BuyerLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EBF7FF'),
      appBar: AppBar(
        title: const Text("Buyer Home Page"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: const Text("Sign Out"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchMedView(),
                ),
              );
            },
            child: const Text("Search Medicine"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckOutView(),
                ),
              );
            },
            child: const Text("Check Out"),
          ),
        ],
      ),
    );
  }
}
