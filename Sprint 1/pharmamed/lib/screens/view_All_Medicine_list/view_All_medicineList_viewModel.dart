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
    // dynamic _name = "Med";
    // dynamic _generic = "Par";
    // dynamic _price = "30";
    // dynamic _quantity = "100";
    // dynamic _description = "----------";
    // dynamic _image = "assets/splash.png";
    // Medicine m1 =
    //     Medicine(_name, _generic, _price, _quantity, _description, _image);
    // Medicine m2 =
    //     Medicine(_name, _generic, _price, _quantity, _description, _image);

    // medicineList.add(m1);
    // medicineList.add(m2);
    print(
        "--------------------------------------------------------------------------");
    print(medicineList.length);
    for (var i = 0; i < medicineList.length; i++) {
      print(medicineList[i].name +
          "--------------------------------------------------------------------------");
      print(medicineList[i].generic);
      print(medicineList[i].price +
          "--------------------------------------------------------------------------");
    }
    print(
        "--------------------------------------------------------------------------");
  }
}
