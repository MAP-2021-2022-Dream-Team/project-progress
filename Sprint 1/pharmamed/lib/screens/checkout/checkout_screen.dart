import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/checkout/checkout_viewModel.dart';
import 'package:stacked/stacked.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckOutViewModel>.reactive(
      viewModelBuilder: () => CheckOutViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: HexColor('#EBF7FF'),
        appBar: AppBar(title: const Text("My Cart")),
        body: ListView.builder(
          itemCount: model.cartMedicineList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      // color: HexColor("#70BFFF"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.125,
                            width: MediaQuery.of(context).size.width * 0.30,
                            margin: const EdgeInsets.all(10),
                            child: Image.network(
                              model.cartMedicineList[index].image,
                              height:
                                  MediaQuery.of(context).size.height * 0.125,
                              width: MediaQuery.of(context).size.width * 0.30,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                model.cartMedicineList[index].name,
                                // model.getAllMedicineList()[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(model.cartMedicineList[index].generic),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: Text(
                                      "Pri: " +
                                          model.cartMedicineList[index].price,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(
                                      "Qty: " +
                                          model
                                              .cartMedicineList[index].quantity,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(2),
                                    minimumSize: const Size(20, 20),
                                    primary:
                                        const Color.fromARGB(185, 250, 50, 50)),
                                onPressed: () {
                                  model.decrement(index);
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                              ),
                              Text(
                                "${model.counter[index]}",
                                textAlign: TextAlign.center,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(2),
                                      minimumSize: const Size(20, 20),
                                      primary: const Color.fromARGB(
                                          178, 248, 248, 14)),
                                  onPressed: () {
                                    model.increment(index);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 15,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            model.placeOrder(context);
          },
          label: const Text("Check Out"),
          backgroundColor: HexColor('#0D5F96'),
        ),
      ),
    );
  }
}
