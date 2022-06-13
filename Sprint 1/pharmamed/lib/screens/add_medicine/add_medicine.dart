import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/add_medicine/add_medicineViewModel.dart';
import 'package:stacked/stacked.dart';
import 'add_medicineViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  //final postRef = FirebaseDatabase.instance.ref().child('medicines');
  //firebase_storage.FirebaseStorage storage =
  //firebase_storage.FirebaseStorage.instance;
  //late File _image;
  //final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    CollectionReference medicines =
        FirebaseFirestore.instance.collection('medicines');
    return ViewModelBuilder<AddMedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Add New Medicine"),
        ),
        body: AddMedBody.body(context, model),
        backgroundColor: HexColor('#EBF7FF'),
      ),
      viewModelBuilder: () => AddMedViewModel(),
    );
  }
}

class AddMedBody {
  static Widget body(BuildContext context, AddMedViewModel model) {
    //firebase_storage.Reference ref =
    //firebase_storage.FirebaseStorage.instance.ref();
    //UploadTask uploadTask = ref.putFile(_image!.absolute);
    return Container(
      padding: const EdgeInsets.all(30),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header(),
            txt(),
            nameText(),
            nameInput(),
            genericText(),
            genericInput(),
            priceText(),
            priceInput(),
            descText(),
            descInput(),
            qttText(),
            qttInput(),
            imgText(),
            imgInput(model),
            addButton(context, model)
          ],
        ),
      ),
    );
  }

  static Widget header() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Add New Medicine',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static Widget txt() {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 50),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Fill up the details of the new medicine.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  static Widget descText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Description'),
      ),
    );
  }

  static Widget descInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Medicine Description',
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: AddMedViewModel.descController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget genericText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Generic'),
      ),
    );
  }

  static Widget genericInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Medicine Generic',
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: AddMedViewModel.genController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget nameText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Name'),
      ),
    );
  }

  static Widget nameInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Medicine Name',
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: AddMedViewModel.nameController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget priceText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Price'),
      ),
    );
  }

  static Widget priceInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Medicine Price',
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: AddMedViewModel.priceController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget qttText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Quantity'),
      ),
    );
  }

  static Widget qttInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Medicine Quantity',
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: AddMedViewModel.qttController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  static Widget imgText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Image'),
      ),
    );
  }

  static Widget imgInput(AddMedViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          onPressed: () {
            model.saveImg();
          },
          child: const Text('Upload Image'),
        ),
      ),
    );
  }

  static Widget addButton(BuildContext context, AddMedViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          model.addMed(context);
        },
        child: const Text('ADD'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: HexColor('#0D5F96'),
        ),
      ),
    );
  }

  static void succesfulToast(String feedback) {
    Fluttertoast.showToast(
        msg: feedback,
        gravity: ToastGravity.CENTER,
        fontSize: 25,
        backgroundColor: Colors.greenAccent,
        timeInSecForIosWeb: 30000);
  }

  static void errorToast(String feedback) {
    Fluttertoast.showToast(
        msg: feedback,
        gravity: ToastGravity.CENTER,
        fontSize: 25,
        backgroundColor: Colors.redAccent,
        timeInSecForIosWeb: 30000);
  }
}
