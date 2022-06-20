// ignore_for_file: file_names, unnecessary_const

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/view_All_Medicine_list/view_All_medicineList_viewModel.dart';
import 'package:stacked/stacked.dart';

class AllMedicineListView extends StatefulWidget {
  const AllMedicineListView({Key? key}) : super(key: key);

  @override
  State<AllMedicineListView> createState() => _AllMedicineListViewState();
}

class _AllMedicineListViewState extends State<AllMedicineListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllMedicineListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: HexColor('#EBF7FF'),
          appBar: AppBar(title: const Text("All Available Medicines")),
          body: ListView.builder(
            itemCount: model.getMedicineListLength(),
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
                              height:
                                  MediaQuery.of(context).size.height * 0.125,
                              width: MediaQuery.of(context).size.width * 0.30,
                              margin: const EdgeInsets.all(10),
                              child: Image.network(
                                model.medicineList[index].image,
                                height:
                                    MediaQuery.of(context).size.height * 0.125,
                                width: MediaQuery.of(context).size.width * 0.30,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  model.medicineList[index].name,
                                  // model.getAllMedicineList()[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(model.medicineList[index].generic),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: Text(
                                        "Pri: " +
                                            model.medicineList[index].price,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Text(
                                        "Qty: " +
                                            model.medicineList[index].quantity,
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
                                        minimumSize: const Size(30, 30),
                                        primary: const Color.fromARGB(
                                            178, 248, 248, 14)),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.edit,
                                      size: 15,
                                    )),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(2),
                                      minimumSize: const Size(30, 30),
                                      primary: const Color.fromARGB(
                                          185, 250, 50, 50)),
                                  onPressed: () {
                                    model.deleteMedicine(index);
                                    // model.printAnything(index);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    size: 15,
                                  ),
                                )
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
          )),
      viewModelBuilder: () => AllMedicineListViewModel(),
    );
  }
}
