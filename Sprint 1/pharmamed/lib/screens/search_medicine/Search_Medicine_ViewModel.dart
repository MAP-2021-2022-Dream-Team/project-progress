// ignore_for_file: file_names

import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';

class SearchMedViewModel extends BaseViewModel {
  List<Medicine> medicineList = [];
  DatabaseServices databaseServices = locator<DatabaseServices>();

  SearchMedViewModel() {
    getAllMedicines();
  }

  Future getAllMedicines() async {
    // await DatabaseServices.getAllMedicines();
    medicineList = await databaseServices.getAllMedicines(medicineList);
    notifyListeners();
  }

  searchMedicine(String value) {
    if (value.isNotEmpty) {
      final suggestions = medicineList.where((element) {
        String medName = element.name;
        medName = medName.toLowerCase();
        String input = value.toLowerCase();

        return medName.contains(input);
      }).toList();
      medicineList = suggestions;
    } else {
      getAllMedicines();
    }

    notifyListeners();
  }
}
