import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/models/medicines.dart';
import 'package:pharmamed/screens/order_summary/order_summary_viewModel.dart';
import 'package:stacked/stacked.dart';

class OrderSummaryView extends StatelessWidget {
  List<Medicine> selectedMedicines = [];
  List<dynamic> cnt = [];
  int totalPrice = 0;
  OrderSummaryView({
    Key? key,
    required this.selectedMedicines,
    required this.cnt,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderSummaryViewModel>.reactive(
      viewModelBuilder: () =>
          OrderSummaryViewModel(selectedMedicines, cnt, totalPrice),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text("Order Summary Page")),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child:
                    Text("Your Order Summary", style: TextStyle(fontSize: 30)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: ListView.builder(
                    itemCount: selectedMedicines.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: HexColor("#70BFFF"),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                // color: HexColor("#70BFFF"),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.125,
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      margin: const EdgeInsets.all(10),
                                      child: Image.network(
                                        model.selectedMedicines[0].image,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.125,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.30,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          model.selectedMedicines[index].name,
                                          // model.getAllMedicineList()[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(model
                                            .selectedMedicines[index].generic),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 3),
                                              child: Text(
                                                "Pri: " +
                                                    model
                                                        .selectedMedicines[
                                                            index]
                                                        .price,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Text(
                                                "Qty: ${model.cnt[index]}",
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Total ${cnt[index] * int.parse(model.selectedMedicines[index].price)}",
                                          style: const TextStyle(fontSize: 18)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${model.totalPrice}",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: Row(
        //   children: [
        //     FloatingActionButton.extended(
        //       onPressed: () {},
        //       label: const Text("Share Order"),
        //       backgroundColor: HexColor('#0D5F96'),
        //     ),
        //     FloatingActionButton.extended(
        //       onPressed: () {},
        //       label: const Text("Save PDF"),
        //       backgroundColor: HexColor('#0D5F96'),
        //     ),
        //   ],
        // ),
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                model.shareOrder();
              },
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white, primary: HexColor('#0D5F96')),
              child: const Text("Share Order"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // model.register(context);
              },
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white, primary: HexColor('#0D5F96')),
              child: const Text("Save PDF"),
            ),
          ),
        ],
      ),
    );
  }
}
