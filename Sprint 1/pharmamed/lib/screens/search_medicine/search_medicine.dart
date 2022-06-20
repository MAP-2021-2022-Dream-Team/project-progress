import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmamed/screens/search_medicine/Search_Medicine_ViewModel.dart';
import 'package:stacked/stacked.dart';

class SearchMed extends StatefulWidget {
  const SearchMed({Key? key}) : super(key: key);

  @override
  State<SearchMed> createState() => __SearchMedState();
}

class __SearchMedState extends State<SearchMed> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search Medicine');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchMedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: HexColor('#EBF7FF'),
          appBar: AppBar(title: const Text("All Available Medicines")),
          body: Column(
            children: [
              AppBar(
                title: customSearchBar,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: customIcon,
                  )
                ],
              ),
              ListView.builder(
                itemCount: model.getMedicineListLength(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Column(
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
                                        model.medicineList[index].image,
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
                                          model.medicineList[index].name,
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
                                              padding: const EdgeInsets.only(
                                                  right: 3),
                                              child: Text(
                                                "Pri: " +
                                                    model.medicineList[index]
                                                        .price,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Text(
                                                "Qty: " +
                                                    model.medicineList[index]
                                                        .quantity,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          )),
      viewModelBuilder: () => SearchMedViewModel(),
    );
  }
}
