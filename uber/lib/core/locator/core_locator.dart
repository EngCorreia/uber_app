import '../../infra/locator.dart';
import '../data/datasources/system_locale_datasource.dart';
import '../data/datasources/system_locale_datasource_implementation.dart';
import '../data/repositories/system_loacale_repository_implemantation.dart';
import '../domain/repositories/system_locale_repository.dart';
import '../domain/usecases/system_locale_usecase.dart';
//import '../services/permission_handle_service.dart';
import '../services/system_locale_serivce.dart';

void coreLocator() {
  locator.registerLazySingleton<ISystemLocaleDatasource>(() => SystemLocaleDatasourceImplementation(locator()));
  locator.registerLazySingleton<ISystemLocaleRepository>(() => SystemLocaleRepositoryImplementation(locator()));
  locator.registerLazySingleton(() => SystemLocaleUsecase(locator()));
  locator.registerLazySingleton(() => SystemLocaleService(locator()));
//locator.registerLazySingleton(() => PermissionService());
  //locator.registerLazySingleton<AccountState>(() => Empty());
  //locator.registerLazySingleton<AccountState>(() => IsError(message: locator()));
  //locator.registerLazySingleton<AccountState>(() => IsLoading());
  //locator.registerLazySingleton<AccountState>(() => Completed(locator()));
}
