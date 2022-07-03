import 'package:flutter/material.dart';
import 'package:pharmamed/screens/med_description/med_descViewModel.dart';
//import 'package:pharmamed/screens/medicine_desc/medicine_descViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:hexcolor/hexcolor.dart';

class MedicineDesc extends StatefulWidget {
  int index;
  MedicineDesc({Key? key, required this.index}) : super(key: key);

  @override
  State<MedicineDesc> createState() => _MedicineDescState();
}

class _MedicineDescState extends State<MedicineDesc> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MedicineDescViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: HexColor('#EBF7FF'),
        appBar: AppBar(
          title: const Text("Medicine Information"),
        ),
        body: MedDescBody.body(context, model),
      ),
      viewModelBuilder: () => MedicineDescViewModel(widget.index),
    );
  }
}

class MedDescBody {
  static Widget body(BuildContext context, MedicineDescViewModel model) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            medPic(context, model),
            medName(model),
            medGeneric(model),
            medPrice(model),
            medQe(model),
            medDesc(model),
            medAddToCart(context, model),
          ],
        ),
      ),
    );
  }

  static Widget medPic(BuildContext context, MedicineDescViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            model.medicine.image,
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            errorBuilder: (context, object, stackError) {
              return Text(object.toString());
            },
          ),
        ),
      ),
    );
  }

  static Widget medName(MedicineDescViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          model.medicine.name,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static Widget medGeneric(MedicineDescViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Generic: " + model.medicine.generic,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  static Widget medPrice(MedicineDescViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Price" + model.medicine.price,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  static Widget medQe(MedicineDescViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Quantity Available:" + model.medicine.quantity,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  static Widget medDesc(MedicineDescViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Description:" + model.medicine.description,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  static Widget medAddToCart(
      BuildContext context, MedicineDescViewModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            model.addToCart(context);
          },
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white, primary: HexColor('#0D5F96')),
          child: const Text('ADD TO CART'),
        ),
      ),
    );
  }
}
