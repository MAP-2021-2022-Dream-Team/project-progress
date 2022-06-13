// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/screens/seller_landing_lage/seller_landing_screen.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';
import 'add_medicine.dart';

class AddMedViewModel extends BaseViewModel {
  static final descController = TextEditingController();
  static final genController = TextEditingController();
  static final nameController = TextEditingController();
  static final priceController = TextEditingController();
  static final qttController = TextEditingController();
  dynamic feedback = "";
  dynamic path;
  dynamic fileName;
  DatabaseServices databaseServices = locator<DatabaseServices>();

  void addMed(BuildContext context) {
    // DatabaseServices.addMedicines();
    feedback = databaseServices.addMedicines(feedback, path, fileName);

    // if (feedback == "Medicine Added") {
    //   AddMedBody.succesfulToast(feedback);
    // } else {
    //   AddMedBody.errorToast(feedback);
    // }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SellerLandingPage(),
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
