// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/edit_medicine/edit_medicine_viewModel.dart';
import 'package:stacked/stacked.dart';

class EditMedicineView extends StatefulWidget {
  int index;
  EditMedicineView({Key? key, required this.index}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<EditMedicineView> createState() => _EditMedicineViewState();
}

class _EditMedicineViewState extends State<EditMedicineView> {
  // @override
  // void initState() {
  //   super.initState();
  //   EditMedicineViewModel(index);
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditMedicineViewModel>.reactive(
      viewModelBuilder: () => EditMedicineViewModel(widget.index),
      builder: (context, model, child) => EditMedBody.body(context, model),
    );
  }
}

class EditMedBody {
  static Widget body(BuildContext context, EditMedicineViewModel model) {
    return Scaffold(
      body: Container(
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
              nameInput(model),
              genericText(),
              genericInput(model),
              priceText(),
              priceInput(model),
              descText(),
              descInput(model),
              qttText(),
              qttInput(model),
              imgText(),
              imgInput(model),
              addButton(context, model)
            ],
          ),
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
          'Update Medicine Info',
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
          'Fill up the details of any field you want to update',
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

  static Widget descInput(EditMedicineViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: model.medicine.description,
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: model.descController,
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

  static Widget genericInput(EditMedicineViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: model.medicine.generic,
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: model.genController,
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

  static Widget nameInput(EditMedicineViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: model.medicine.name,
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: model.nameController,
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

  static Widget priceInput(EditMedicineViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: model.medicine.price,
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: model.priceController,
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

  static Widget qttInput(EditMedicineViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            hintText: model.medicine.quantity,
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(bottom: 10, left: 15, top: 8),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          controller: model.qttController,
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

  static Widget imgInput(EditMedicineViewModel model) {
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

  static Widget addButton(BuildContext context, EditMedicineViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          model.editMed(context);
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
