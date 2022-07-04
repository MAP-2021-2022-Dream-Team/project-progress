import 'package:pharmamed/models/medicines.dart';
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
}
