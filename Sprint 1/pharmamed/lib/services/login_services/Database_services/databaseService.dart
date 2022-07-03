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
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future getAllMedicines(List<Medicine> medicineList) async {
    var data = await FirebaseFirestore.instance
        .collection("medicines")
        .orderBy("name", descending: false)
        .get();

    medicineList = List.from(data.docs.map((e) => Medicine.fromJson(e.data())));
    return medicineList;
  }

  Future addMedicines(String feedback, String path, String fileName) async {
    File file = File(path);
    var newUrl;
    String name = fileName;
    var docId;

    try {
      // firebase_storage.Reference ref = storage.ref('images/($name)');
      // UploadTask uploadTask = ref.putFile(file);
      // await Future.value(uploadTask);
      // newUrl = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('medicines').add(
        {
          'name': AddMedViewModel.nameController.text.trim(),
          'generic': AddMedViewModel.genController.text.trim(),
          'price': AddMedViewModel.priceController.text.trim(),
          'description': AddMedViewModel.descController.text.trim(),
          'quantity': AddMedViewModel.qttController.text.trim(),
        },
      ).then((value) => docId = value.id);

      String id = docId;

      firebase_storage.Reference ref = storage.ref('images/medicine/$id');
      UploadTask uploadTask = ref.putFile(file);
      await Future.value(uploadTask);
      newUrl = await ref.getDownloadURL();

      FirebaseFirestore.instance.collection('medicines').doc(id).update({
        'image': newUrl.toString(),
        'id': id,
      });

      feedback = "Medicine Added";
      return feedback;
    } on FirebaseException catch (e) {
      feedback = e.toString();
      return feedback;
    }
  }

  Future deleteMedicine(String docId) async {
    await FirebaseFirestore.instance
        .collection('medicines')
        .doc(docId)
        .delete();

    firebase_storage.Reference ref = storage.ref('images/medicine/$docId');
    ref.delete();
  }

  Future editMedicine(String path, String name, String generic, String price,
      String quantity, String description, String docId) async {
    var doc = FirebaseFirestore.instance.collection('medicines').doc(docId);

    if (name.isNotEmpty) {
      doc.update({'name': name});
    }
    if (generic.isNotEmpty) {
      doc.update({'generic': generic});
    }
    if (price.isNotEmpty) {
      doc.update({'price': price});
    }
    if (quantity.isNotEmpty) {
      doc.update({'quantity': quantity});
    }
    if (description.isNotEmpty) {
      doc.update({'description': description});
    }
    if (path != "") {
      File file = File(path);
      var newUrl;
      firebase_storage.Reference ref = storage.ref('images/medicine/$docId');
      UploadTask uploadTask = ref.putFile(file);
      await Future.value(uploadTask);
      newUrl = await ref.getDownloadURL();

      doc.update({
        'image': newUrl.toString(),
      });
    }
  }

  static Future getMedDesc() async {
    //var data =  await FirebaseFirestore.instance.collection('medicines').get
    FirebaseFirestore.instance.collection('medicines').get();
  }

  static Future getProfileDetails() async {}
}
