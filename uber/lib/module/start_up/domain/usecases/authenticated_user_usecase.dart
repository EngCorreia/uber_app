import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:interfaces/interfaces.dart';

import '../../../../core/domain/entities/user_information_entity.dart';
import '../repositories/authenticated_user_repository.dart';

class AuthenticatedUserUsecase implements Usecase<UserInformationEntity, NoParams> {
  AuthenticatedUserUsecase(this.repository);

  final IAuthenticatedUserRepository repository;

  @override
  Future<Either<Failure, UserInformationEntity>> call(NoParams params) async{
    return await repository.localUser();
  }


}