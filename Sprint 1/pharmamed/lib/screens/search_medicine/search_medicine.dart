import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchMed extends StatefulWidget {
  const SearchMed({Key? key}) : super(key: key);

  @override
  State<SearchMed> createState() => _SearchMedState();
}

class _SearchMedState extends State<SearchMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EBF7FF'),
      //appBar: AppBar(
      //title: const Text('Search Medicine'),
      // backgroundColor: HexColor('#EBF7FF'),
      //),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Search Medicine',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
