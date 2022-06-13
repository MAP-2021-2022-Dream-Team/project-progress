import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pharmamed/services/login_services/Database_services/databaseService.dart';
import 'package:pharmamed/services/login_services/add_admin_services/register_admin.dart';
import 'package:pharmamed/services/login_services/forgot_pass_services/forgot_pass_service.dart';
import 'package:pharmamed/services/login_services/register_services/resigter_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/login_services/login_service.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() {
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => DatabaseServices());
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => ForgotPassService());
  locator.registerLazySingleton(() => AddAdminService());
}
