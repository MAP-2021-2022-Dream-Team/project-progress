import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/search_medicine/Search_Medicine_ViewModel.dart';
import 'package:stacked/stacked.dart';

class SearchMedView extends StatefulWidget {
  const SearchMedView({Key? key}) : super(key: key);

  @override
  State<SearchMedView> createState() => __SearchMedViewState();
}

class __SearchMedViewState extends State<SearchMedView> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchMedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: HexColor('#EBF7FF'),
          appBar: AppBar(title: const Text("Medicines")),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Medicine Name',
                          hintStyle: const TextStyle(fontSize: 14),
                          contentPadding: const EdgeInsets.only(
                              bottom: 3, left: 15, top: 3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          model.searchMedicine(value);
                        },
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ListView.builder(
                    itemCount: model.medicineList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width,
                              child: GestureDetector(
                                onTap: () {
                                  model.medicineDescription(index, context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: HexColor("#70BFFF"),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  // color: HexColor("#70BFFF"),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        margin: const EdgeInsets.all(10),
                                        child: Image.network(
                                          model.medicineList[index].image,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            model.medicineList[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(model
                                              .medicineList[index].generic),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 3),
                                            child: Text(
                                              "Pri: " +
                                                  model.medicineList[index]
                                                      .price,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Text(
                                              "Qty: " +
                                                  model.medicineList[index]
                                                      .quantity,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
      viewModelBuilder: () => SearchMedViewModel(),
    );
  }
}
