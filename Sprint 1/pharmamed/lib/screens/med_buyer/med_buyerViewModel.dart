import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pharmamed/models/medicines.dart';
//import 'package:pharmamed/screens/medicine_desc/medicine_desc.dart';
//import 'package:pharmamed/services/login_services/Firebase_services/firebaseDatabase.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';

import '../../app/locator.dart';
import '../med_description/med_desc.dart';

class MedicineBuyerViewModel extends BaseViewModel {
  static List<Medicine> medicineList = [];
  DatabaseServices databaseServices = locator<DatabaseServices>();

  MedicineBuyerViewModel() {
    getMedicine();
  }

  List<Medicine> getMedicineList() {
    return medicineList;
  }

  int getMedicineListLength() {
    return medicineList.length;
  }

  Future getMedicine() async {
    medicineList = await databaseServices.getAllMedicines(medicineList);
    notifyListeners();
  }

  //String sendData(BuildContext context, MedicineBuyerViewModel model, int index) {
  //int data = model.getMedicineList()[index];
  //Navigator.push(
  //context,
  //MaterialPageRoute(
  //builder: (context) => MedicineDesc(data),
  //),
  //);
  //return data;
  //}

  void getData(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicineDesc(),
      ),
    );

    Navigator.of(context).pushNamed('med', arguments: index);
    return getIndex(index);
  }

  void getIndex(int index) {
    DatabaseServices.getData(index);
  }
}
