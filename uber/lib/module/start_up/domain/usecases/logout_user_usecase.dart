import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:interfaces/interfaces.dart';

import '../repositories/authenticated_user_repository.dart';

class LogoutUserUsecase implements Usecase<bool, NoParams> {

  LogoutUserUsecase(this.repository);
  final IAuthenticatedUserRepository repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.logout();
  }
}