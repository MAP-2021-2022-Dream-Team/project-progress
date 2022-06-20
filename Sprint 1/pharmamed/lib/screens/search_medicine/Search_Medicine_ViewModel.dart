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
}
