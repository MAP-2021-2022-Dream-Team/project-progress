// ignore_for_file: file_names

import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/services/login_services/Firebase_services/firebaseDatabase.dart';
import 'package:stacked/stacked.dart';

class AllMedicineListViewModel extends BaseViewModel {
  static List<Medicine> medicineList = [];

  AllMedicineListViewModel() {
    getAllMedicines();
  }

  List<Medicine> getAllMedicineList() {
    // FireBaseDatabaseServices.getAllMedicines();
    return medicineList;
  }

  int getMedicineListLength() {
    return medicineList.length;
  }

  Future getAllMedicines() async {
    await FireBaseDatabaseServices.getAllMedicines();
    notifyListeners();
  }
}
