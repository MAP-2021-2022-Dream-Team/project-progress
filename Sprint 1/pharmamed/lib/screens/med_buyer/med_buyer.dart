// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// //import 'package:pharmamed/screens/med_buyer/med_buyer_viewModel.dart';
// //import 'package:pharmamed/screens/medicine_desc/medicine_desc.dart';
// import 'package:stacked/stacked.dart';

// import 'med_buyerViewModel.dart';

// class MedicineList extends StatefulWidget {
//   MedicineList({Key? key}) : super(key: key);

//   @override
//   State<MedicineList> createState() => _MedicineListState();
// }

// class _MedicineListState extends State<MedicineList> {
//   void getData(context, index) {
//     Navigator.of(context).pushNamed('med', arguments: index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MedicineBuyerViewModel>.reactive(
//       builder: (context, model, child) => Scaffold(
//           backgroundColor: HexColor('#EBF7FF'),
//           appBar: AppBar(title: const Text("All Available Medicines")),
//           body: ListView.builder(
//             itemCount: model.getMedicineListLength(),
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//                     child: SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.15,
//                       width: MediaQuery.of(context).size.width,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: HexColor("#70BFFF"),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: const Offset(
//                                     0, 3), // changes position of shadow
//                               ),
//                             ],
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10))),
//                         // color: HexColor("#70BFFF"),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.125,
//                               width: MediaQuery.of(context).size.width * 0.30,
//                               margin: const EdgeInsets.all(10),
//                               child: Image.network(
//                                 model.getMedicineList()[index].image,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.125,
//                                 width: MediaQuery.of(context).size.width * 0.30,
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   //model.getMedicineList()[index].image,
//                                   model.getMedicineList()[index].name,
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                                 Text(model.getMedicineList()[index].generic),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 3),
//                                       child: Text(
//                                         "Pri: " +
//                                             model
//                                                 .getMedicineList()[index]
//                                                 .price,
//                                         style: const TextStyle(fontSize: 12),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 3),
//                                       child: Text(
//                                         "Qty: " +
//                                             model
//                                                 .getMedicineList()[index]
//                                                 .quantity,
//                                         style: const TextStyle(fontSize: 12),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ElevatedButton.icon(
//                                   style: ElevatedButton.styleFrom(
//                                     padding: const EdgeInsets.all(2),
//                                     //minimumSize: const Size(30, 30),
//                                     primary: HexColor('#0D5F96'),
//                                   ),
//                                   onPressed: () {
//                                     //getData(context, index);
//                                     //_sendDataToMedDescPage(context);
//                                     model.getData(context, index);
//                                   },
//                                   icon: const Icon(Icons.pageview),
//                                   label: const Text('View'),
//                                 ),
//                                 ElevatedButton.icon(
//                                   style: ElevatedButton.styleFrom(
//                                     padding: const EdgeInsets.all(2),
//                                     //minimumSize: const Size(30, 30),
//                                     primary: HexColor('#0D5F96'),
//                                   ),
//                                   onPressed: () {
//                                     addedAlert();
//                                   },
//                                   icon: const Icon(Icons.add_shopping_cart),
//                                   label: const Text('Add'),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           )),
//       viewModelBuilder: () => MedicineBuyerViewModel(),
//     );
//   }

//   addedAlert() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           actions: <Widget>[
//             FlatButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             )
//           ],
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(20),
//             ),
//           ),
//           contentPadding: const EdgeInsets.only(top: 10),
//           title: const Text(
//             'Medicine added to cart',
//             style: TextStyle(fontSize: 24),
//           ),
//         );
//       },
//     );
//   }
// }
