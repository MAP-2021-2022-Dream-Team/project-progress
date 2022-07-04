import 'package:pharmamed/models/medicines.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';

class OrderSummaryViewModel extends BaseViewModel {
  List<Medicine> selectedMedicines = [];
  List<dynamic> cnt = [];
  int totalPrice;

  OrderSummaryViewModel(this.selectedMedicines, this.cnt, this.totalPrice) {
    totalPrice = 0;
    for (var i = 0; i < selectedMedicines.length; i++) {
      int count = cnt[i];
      int price = int.parse(selectedMedicines[i].price);
      totalPrice = totalPrice + (price * count);
    }
    notifyListeners();
  }

  shareOrder() async {
    String msg = "";

    for (var i = 0; i < selectedMedicines.length; i++) {
      msg = msg +
          "${i + 1} Name: ${selectedMedicines[i].name}    Quantity: ${cnt[i]}    Price: ${selectedMedicines[i].price}\n";
    }
    msg = msg + "Total Payment: $totalPrice";

    await Share.share("Your Order Summary: \n$msg");
  }

  savePDF() {}
}
