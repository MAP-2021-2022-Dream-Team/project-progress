// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pharmamed/app/locator.dart';
import 'package:pharmamed/main.dart';
import 'package:pharmamed/services/login_services/add_admin_services/register_admin.dart';
import 'package:stacked/stacked.dart';

class AddAdmin extends BaseViewModel {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneNumController = TextEditingController();
  static final usernameController = TextEditingController();
  static final passwordController = TextEditingController();

  AddAdminService addAdminService = locator<AddAdminService>();

  void register(BuildContext context) async {
    // AddAdmins.add();
    addAdminService.addBuyer();

    const MyApp();
  }
}
