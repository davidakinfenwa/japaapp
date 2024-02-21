import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:japaapp/core/dependence/auth_dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/core/util/permission_helper.dart';



import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/interceptors.dart';

GetIt getIt = GetIt.instance;

Future<void> initGetIt() async {
  authDependenciesInit(getIt);


  // shared

  // exception mapper
  getIt.registerLazySingleton<ExceptionMapper>(() => ExceptionMapper());

  final sharedPreference = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreference);

  // contact permissions
  getIt.registerLazySingleton<PermissionHelper>(() => PermissionHelper());

  // interceptors
  getIt.registerLazySingleton<LoggingInterceptors>(() => LoggingInterceptors());
  getIt.registerLazySingleton<HeaderInterceptors>(() => HeaderInterceptors());

  // internet checker
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: getIt()));
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
