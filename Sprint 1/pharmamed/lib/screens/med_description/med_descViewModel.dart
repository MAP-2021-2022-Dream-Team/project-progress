import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:pharmamed/services/login_services/Firebase_services/firebaseDatabase.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/medicines.dart';

class MedicineDescViewModel extends BaseViewModel {
  static List<Medicine> medicineList = [];
  int index = 0;

  MedicineDescViewModel() {
    getMedicines();
  }

  List<Medicine> getMedicineList() {
    return medicineList;
  }

  int getMedicineListLength() {
    return medicineList.length;
  }

  Future getMedicines() async {
    await DatabaseServices.getMedicines();
  }

  int getIndex(int index) {
    DatabaseServices.getData(index);
    return index;
  }
}
