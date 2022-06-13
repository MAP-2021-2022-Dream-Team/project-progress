// ignore_for_file: file_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/screens/add_medicine/add_medicineViewModel.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

@lazySingleton
class DatabaseServices {
  Future getAllMedicines(List<Medicine> medicineList) async {
    var data = await FirebaseFirestore.instance
        .collection("medicines")
        .orderBy("name", descending: false)
        .get();

    medicineList = List.from(data.docs.map((e) => Medicine.fromJson(e.data())));
    return medicineList;
  }

  Future addMedicines(String feedback, String path, String fileName) async {
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    File file = File(path);
    var newUrl;
    String name = fileName;

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
      feedback = "Medicine Added";
      return feedback;
    } on FirebaseException catch (e) {
      feedback = e.toString();
      return feedback;
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
