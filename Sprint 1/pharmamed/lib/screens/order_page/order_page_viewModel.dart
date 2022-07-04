import 'package:flutter/material.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/screens/order_summary/order_summary_screen.dart';
import 'package:stacked/stacked.dart';

class OrderViewModel extends BaseViewModel {
  List<Medicine> selectedMedicines = [];
  List<dynamic> cnt = [];
  int totalPrice;

  OrderViewModel(this.selectedMedicines, this.cnt, this.totalPrice) {
    totalPrice = 0;
    for (var i = 0; i < selectedMedicines.length; i++) {
      int count = cnt[i];
      int price = int.parse(selectedMedicines[i].price);
      totalPrice = totalPrice + (price * count);
    }
    notifyListeners();
  }

  orderSummary(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderSummaryView(
            selectedMedicines: selectedMedicines,
            cnt: cnt,
            totalPrice: totalPrice),
      ),
    );
  }
}
