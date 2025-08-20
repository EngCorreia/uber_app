import 'package:get_it/get_it.dart';
import 'package:local/local.dart';
import 'package:remote/remote.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/locator/core_locator.dart';
import '../services/call_sms.dart';
import '../views/home/home_view_model.dart';
import '../views/startup/startup_view_model.dart';



final GetIt locator = GetIt.I;
void setupLocator(String? baseURL, {String? enviroment}) {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => StartupViewModel());
  locator.registerSingleton(CallsAndMessagesService());
  //locator.registerFactory(() => HomeViewModel());

  coreLocator();

  //CORE
  if (enviroment == 'debug') {
    locator.registerLazySingleton<IRemote>(() => RemoteFkImplementation());
    locator.registerLazySingleton<ILocalDatabase>(
        () => LocalDatabaseImplementation(locator()));
    locator.registerLazySingleton<ILocalStorage>(
        () => LocalStorageImplementation());
  }

  if (enviroment == 'dev' || enviroment == 'prd') {
    locator
        .registerLazySingleton<IRemote>(() => RemoteImplementation(baseURL!));

    locator.registerLazySingleton<ILocalDatabase>(
        () => LocalDatabaseImplementation(locator()));
    locator.registerLazySingleton<ILocalStorage>(
        () => LocalStorageImplementation());
  }
}
