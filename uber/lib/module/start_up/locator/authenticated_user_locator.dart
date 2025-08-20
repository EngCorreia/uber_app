import '../../../infra/locator.dart';
import '../data/data/local/authenticated_user_datasource.dart';
import '../data/data/local/authenticated_user_datasource_implemantation.dart';
import '../data/repositories/authenticated_user_repository_implementation.dart';
import '../domain/repositories/authenticated_user_repository.dart';
import '../domain/usecases/authenticated_user_usecase.dart';
import '../domain/usecases/logout_user_usecase.dart';
import '../domain/usecases/save_user_usecase.dart';
import '../service/authenticated_user_service.dart';

void authenticatedUserLocator() {

  // DATA SOURCE IMPLEMENTATION
  locator.registerLazySingleton<IAuthenticatedUserDatasource>(() => AuthenticatedUserDatasourceImplementation(locator()));

  // REPOSITORY IMPLEMENTATION
  locator.registerLazySingleton<IAuthenticatedUserRepository>(() => AuthenticatedUserRepositoryImplementation(locator()));

  // USE CASE
  locator.registerLazySingleton(() => LogoutUserUsecase(locator()));
  locator.registerLazySingleton(() => AuthenticatedUserUsecase(locator()));
  locator.registerLazySingleton(() => SaveUserUsecase(locator()));

  // SERVICE
  locator.registerFactory(() => LogoutUserService(locator()));
  locator.registerFactory(() => SaveUserService(locator()));
  locator.registerLazySingleton(() => AuthenticatedUserService(locator()));

}