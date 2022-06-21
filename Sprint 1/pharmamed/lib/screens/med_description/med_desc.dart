import 'package:flutter/material.dart';
import 'package:pharmamed/screens/med_description/med_descViewModel.dart';
//import 'package:pharmamed/screens/medicine_desc/medicine_descViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:hexcolor/hexcolor.dart';

class MedicineDesc extends StatefulWidget {
  MedicineDesc({Key? key}) : super(key: key);

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
        //ListView.builder(
        //itemCount: model.getMedicineListLength(),
        //itemBuilder: (context, index) {
        //return Column(
        //children: const [
        //Text(
        //model.getMedicineList()[index].name,
        //'Med Desc',
        //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //),
        //],
        //);
        //}),
        //viewModelBuilder: () => MedicineDescViewModel(),
      ),
      viewModelBuilder: () => MedicineDescViewModel(),
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
            //medPic(),
            medName(),
            medGeneric(),
            medPrice(),
            medQe(),
          ],
        ),
      ),
    );
  }

  static Widget medName() {
    return const Padding(
      padding: EdgeInsets.only(top: 200),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Med 1',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static Widget medPic() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.center,
        child: Image.asset('assets/med1.png'),
      ),
    );
  }

  static Widget medGeneric() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '5mg Paracitamol',
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  static Widget medPrice() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Price: 12',
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  static Widget medQe() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Quantiti Available: 100',
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
