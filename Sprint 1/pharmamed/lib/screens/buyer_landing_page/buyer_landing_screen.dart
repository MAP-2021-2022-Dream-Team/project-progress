import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/app/route.dart';

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
      body: Center(child: Text("Buyer Home Page")),
    );
  }
}
