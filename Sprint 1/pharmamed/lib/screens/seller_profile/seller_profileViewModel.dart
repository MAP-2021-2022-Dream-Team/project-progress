import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/services/login_services/Firebase_services/firebaseDatabase.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SellerProfileViewModel extends BaseViewModel {
  void sellerProfile(BuildContext context) {
    const MyApp();
  }

  Future getProfileDetails() async {
    //await FireBaseDatabaseServices.getProfileDetails();
    //notifyListeners();
  }
}
