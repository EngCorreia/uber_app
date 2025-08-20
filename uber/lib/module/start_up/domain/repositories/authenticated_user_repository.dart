import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../../../../core/domain/entities/user_information_entity.dart';

abstract class IAuthenticatedUserRepository {
  Future<Either<Failure,UserInformationEntity>> localUser();
  Future<Either<Failure,bool>> saveStore(UserInformationEntity user);
  Future<Either<Failure,bool>> updateStore(UserInformationEntity user);
  Future<Either<Failure,bool>> logout();
}