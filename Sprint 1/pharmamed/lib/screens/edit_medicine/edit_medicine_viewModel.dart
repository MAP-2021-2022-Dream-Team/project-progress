// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/screens/view_All_Medicine_list/view_all_medicineList_screen.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';

class EditMedicineViewModel extends BaseViewModel {
  final descController = TextEditingController();
  final genController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final qttController = TextEditingController();
  dynamic path = "";
  dynamic fileName;
  DatabaseServices databaseServices = locator<DatabaseServices>();

  late String name;
  late String generic;
  late String price;
  late String quantity;
  late String description;
  Medicine medicine = Medicine("", "", "", "", "", "");

  EditMedicineViewModel(int index) {
    getMedicine(index);
  }

  Future getMedicine(int index) async {
    List<Medicine> medicineList = [];
    medicineList = await databaseServices.getAllMedicines(medicineList);
    medicine = medicineList.elementAt(index);
    notifyListeners();
  }

  void editMed(BuildContext context) {
    name = nameController.text.trim();
    generic = genController.text.trim();
    price = priceController.text.trim();
    quantity = qttController.text.trim();
    description = descController.text.trim();

    databaseServices.editMedicine(
        path, name, generic, price, quantity, description, medicine.id);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AllMedicineListView(),
      ),
    );
  }

  void saveImg() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
      // allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (results == null) {
      const ScaffoldMessenger(
        child: SnackBar(
          content: Text('No file selected.'),
        ),
      );
    }
    path = results?.files.single.path;
    fileName = results?.files.single.name;
  }
}
