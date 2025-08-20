

import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:interfaces/interfaces.dart';

import '../../../../core/domain/entities/user_information_entity.dart';
import '../repositories/authenticated_user_repository.dart';

class SaveUserUsecase implements Usecase<bool, UserInformationEntity> {
  SaveUserUsecase(this.repository);

  final IAuthenticatedUserRepository repository;

  @override
  Future<Either<Failure, bool>> call(UserInformationEntity params) async {
    return await repository.saveStore(params);
  }
}