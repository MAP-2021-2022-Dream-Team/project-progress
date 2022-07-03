import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/screens/buyer_landing_page/buyer_landing_screen.dart';
//import 'package:pharmamed/services/login_services/Firebase_services/firebaseDatabase.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';

import '../../models/medicines.dart';

class MedicineDescViewModel extends BaseViewModel {
  DatabaseServices databaseServices = locator<DatabaseServices>();
  Medicine medicine = Medicine("", "", "", "", "", "");
  int index;

  MedicineDescViewModel(this.index) {
    getMedicine(index);
  }

  Future getMedicine(int index) async {
    List<Medicine> medicineList = [];
    medicineList = await databaseServices.getAllMedicines(medicineList);
    medicine = medicineList.elementAt(index);
    notifyListeners();
  }

  addToCart(BuildContext context) async {
    await databaseServices.addMedicineToCart(medicine);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BuyerLandingPage(),
      ),
    );
  }
}
