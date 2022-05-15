import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
    );
  }
}
