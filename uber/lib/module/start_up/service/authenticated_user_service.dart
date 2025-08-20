import 'package:interfaces/interfaces.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/domain/entities/user_information_entity.dart';
import '../domain/usecases/authenticated_user_usecase.dart';
import '../domain/usecases/logout_user_usecase.dart';
import '../domain/usecases/save_user_usecase.dart';

class AuthenticatedUserService {
  AuthenticatedUserService(this.usecase);

  final AuthenticatedUserUsecase usecase;

  final BehaviorSubject<ApiResponse<UserInformationEntity>> _response = BehaviorSubject<ApiResponse<UserInformationEntity>>.seeded(
          ApiResponse.loading("loading..."));

  UserInformationEntity? get currentUser => _response.hasValue && _response.value.data != null ? _response.value.data : null;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Stream<ApiResponse<UserInformationEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<UserInformationEntity>> get dataSink => _response.sink;

  Future getLocalUser() async {
    final result = await usecase(NoParams());

    ApiResponse<UserInformationEntity> response = result.fold((l)=> ApiResponse.error('$l'), (r) {
      _isLoggedIn = r.token.isNotEmpty;
      return ApiResponse.completed(r);
    });
    dataSink.add(response);
  }
}

class LogoutUserService {
  LogoutUserService(this.usecase);
  final LogoutUserUsecase usecase;

  ApiResponse<bool> _response = ApiResponse.loading("loading...");

  Future<ApiResponse<bool>> logout() async {
    final result = await usecase(NoParams());
    _response = result.fold(
        (l) => ApiResponse.error('$l'), (r) => ApiResponse.completed(r));

    return _response;
  }
}

class SaveUserService {
  SaveUserService(this.usecase);
  final SaveUserUsecase usecase;

  ApiResponse<bool> _response = ApiResponse.loading("loading...");
  Future<ApiResponse<bool>> saveStore({required UserInformationEntity user}) async {
    final result = await usecase(user);
    _response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return _response;
  }
}