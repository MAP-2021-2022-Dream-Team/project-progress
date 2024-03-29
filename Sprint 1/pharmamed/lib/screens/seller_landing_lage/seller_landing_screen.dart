import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/Add_Admin/adding_admin_screen.dart';
import 'package:pharmamed/screens/login/login_Screen.dart';
import 'package:pharmamed/screens/view_All_Medicine_list/view_all_medicineList_screen.dart';
import 'package:pharmamed/screens/seller_profile/seller_profile.dart';
import '../add_medicine/add_medicine.dart';

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
        title: const Text("Seller Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SellerProfile(),
                ),
              );
            },
            icon: const Icon(Icons.account_circle),
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Adding(),
                  ),
                );
              },
              child: const Text("Add Admin"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllMedicineListView(),
                  ),
                );
              },
              child: const Text("All Available Medicine List"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddMedicinePage(),
                  ),
                );
              },
              icon: const Icon(Icons.add_box),
              label: const Text('Add New Medicine'),
            ),
            //ElevatedButton(
            //onPressed: () {
            //FirebaseAuth.instance.signOut();
            //Navigator.push(
            //context,
            //MaterialPageRoute(
            //builder: (context) => const Login(),
            //),
            //);
            //},
            //child: const Text("Sign Out"),
            //),
          ],
        ),
      ),
    );
  }
}
