import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/screens/add_medicine/add_medicineViewModel.dart';
import 'package:pharmamed/screens/view_All_Medicine_list/view_All_medicineList_viewModel.dart';

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
    FirebaseFirestore.instance.collection('medicines').add(
      {
        'description': AddMedViewModel.descController.text.trim(),
        'generic': AddMedViewModel.genController.text.trim(),
        'name': AddMedViewModel.nameController.text.trim(),
        'price': AddMedViewModel.priceController.text.trim(),
        'quantity': AddMedViewModel.qttController.text.trim(),
      },
    );
  }
}
