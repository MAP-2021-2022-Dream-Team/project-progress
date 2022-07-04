// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/models/carts.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:stacked/stacked.dart';

class CheckOutViewModel extends BaseViewModel {
  List<Cart> cartIdList = [];
  List<Medicine> medicineList = [];
  List<Medicine> cartMedicineList = [];
  DatabaseServices databaseServices = locator<DatabaseServices>();

  List<dynamic> counter = [];
  int totalPrice = 0;

  CheckOutViewModel() {
    getCartMedicines();
  }

  getCartMedicines() async {
    // int k = 0;
    cartIdList = await databaseServices.getAllCartMedicines(cartIdList);
    medicineList = await databaseServices.getAllMedicines(medicineList);
    if (cartIdList.length != 0 && medicineList.length != 0) {
      for (var i = 0; i < cartIdList.length; i++) {
        for (var j = 0; j < medicineList.length; j++) {
          if (cartIdList[i].medicine == medicineList[j].id) {
            cartMedicineList.add(medicineList[j]);
            counter.add(0);
            // k++;
          }
        }
      }
    }
    notifyListeners();
  }

  increment(int index) {
    if (counter[index] >= 0 &&
        counter[index] < int.parse(cartMedicineList[index].quantity)) {
      counter[index]++;
    }
    calculateTotalPrice();
    notifyListeners();
  }

  decrement(int index) {
    if (counter[index] > 0 &&
        counter[index] <= int.parse(cartMedicineList[index].quantity)) {
      counter[index]--;
    }
    calculateTotalPrice();
    notifyListeners();
  }

  calculateTotalPrice() {
    for (var i = 0; i < cartMedicineList.length; i++) {
      totalPrice += int.parse(cartMedicineList[i].price);
    }
  }

  placeOrder(BuildContext context) {
    List<Medicine> selectedMedicines = [];

    if (totalPrice > 0) {
      for (var i = 0; i < cartMedicineList.length; i++) {
        if (counter[i] > 0) {
          selectedMedicines.add(cartMedicineList[i]);
        }
      }

      //   Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ,
      //   ),
      // );
    }
  }
}
