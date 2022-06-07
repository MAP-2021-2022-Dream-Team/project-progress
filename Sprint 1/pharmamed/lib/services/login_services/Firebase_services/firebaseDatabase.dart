import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/screens/add_medicine/add_medicineViewModel.dart';
import 'package:pharmamed/screens/view_All_Medicine_list/view_All_medicineList_viewModel.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pharmamed/screens/seller_profile/seller_profileViewModel.dart';

@lazySingleton
class FireBaseDatabaseServices {
  static Future getAllMedicines() async {
    var data = await FirebaseFirestore.instance
        .collection("medicines")
        .orderBy("name", descending: false)
        .get();

    AllMedicineListViewModel.medicineList =
        List.from(data.docs.map((e) => Medicine.fromJson(e.data())));
  }

  static Future addMedicines() async {
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    File file = File(AddMedViewModel.path);
    var newUrl;
    String name = AddMedViewModel.fileName;

    try {
      firebase_storage.Reference ref = storage.ref('images/($name)');
      UploadTask uploadTask = ref.putFile(file);
      await Future.value(uploadTask);
      newUrl = await ref.getDownloadURL();

      FirebaseFirestore.instance.collection('medicines').add(
        {
          'name': AddMedViewModel.nameController.text.trim(),
          'generic': AddMedViewModel.genController.text.trim(),
          'price': AddMedViewModel.priceController.text.trim(),
          'description': AddMedViewModel.descController.text.trim(),
          'quantity': AddMedViewModel.qttController.text.trim(),
          'image': newUrl.toString(),
        },
      );
      AddMedViewModel.feedback = "Medicine Added";
    } on FirebaseException catch (e) {
      AddMedViewModel.feedback = e.toString();
    }
  }

  static Future getProfileDetails() async {
    FirebaseFirestore.instance.collection('user').add(
      {
        //'uname': getProfileDetails.unameController.text.trim(),
        //'fname': getProfileDetails.fnameController.text.trim(),
        //'email': getProfileDetails.emailController.text.trim(),
        //'phone': getProfileDetails.phoneController.text.trim();
      },
    );
  }
}
