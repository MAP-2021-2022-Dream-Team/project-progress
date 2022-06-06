import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/services/login_services/Firebase_services/firebaseDatabase.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'add_medicine.dart';

class AddMedViewModel extends BaseViewModel {
  static final descController = TextEditingController();
  static final genController = TextEditingController();
  static final nameController = TextEditingController();
  static final priceController = TextEditingController();
  static final qttController = TextEditingController();
  static String feedback = "";

  void addMed(BuildContext context) {
    FireBaseDatabaseServices.addMedicines();

    if (feedback == "Medicine Added") {
      AddMedBody.succesfulToast();
    } else {
      AddMedBody.errorToast();
    }

    const MyApp();
  }
}
