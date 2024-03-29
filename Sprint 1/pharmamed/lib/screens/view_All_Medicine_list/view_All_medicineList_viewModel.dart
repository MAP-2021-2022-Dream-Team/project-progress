// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/screens/edit_medicine/edit_medicine_screen.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';

class AllMedicineListViewModel extends BaseViewModel {
  List<Medicine> medicineList = [];
  DatabaseServices databaseServices = locator<DatabaseServices>();

  AllMedicineListViewModel() {
    getAllMedicines();
  }

  List<Medicine> getAllMedicineList() {
    return medicineList;
  }

  int getMedicineListLength() {
    return medicineList.length;
  }

  Future getAllMedicines() async {
    // await DatabaseServices.getAllMedicines();
    medicineList = await databaseServices.getAllMedicines(medicineList);
    notifyListeners();
  }

  Future deleteMedicine(int index) async {
    String docId = medicineList.elementAt(index).id;

    await databaseServices.deleteMedicine(docId);

    getAllMedicines();
  }

  editMedicine(int index, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMedicineView(
          index: index,
        ),
      ),
    );
  }
}
