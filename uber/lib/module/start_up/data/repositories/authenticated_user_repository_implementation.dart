
import 'package:dartz/dartz.dart';

import 'package:errors/errors.dart';

import '../../../../core/domain/entities/user_information_entity.dart';
import '../../domain/repositories/authenticated_user_repository.dart';
import '../data/local/authenticated_user_datasource.dart';

class AuthenticatedUserRepositoryImplementation implements IAuthenticatedUserRepository{
  AuthenticatedUserRepositoryImplementation(this.datasource);

  final IAuthenticatedUserDatasource datasource;


  @override
  Future<Either<Failure, UserInformationEntity>> localUser() async {
   try{
    var result = await datasource.get();
    return Right(result);
   }catch(e){
    return Left(FetchDataFailure("$e"));
   }
  }

  @override
  Future<Either<Failure, bool>> logout() async{
   try{
    var result = await datasource.remove();
    return Right(result);
   }catch(e){
    return Left(FetchDataFailure("$e"));
   }
  }

  @override
  Future<Either<Failure, bool>> saveStore(UserInformationEntity user) async {
    try{
      var result = await datasource.saveStore(user);
      return Right(result);
    }catch(e){
      return Left(FetchDataFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, bool>> updateStore(UserInformationEntity user) async {
    try{
      var result = await datasource.updateStore(user);
      return Right(result);
    }catch(e){
      return Left(FetchDataFailure("$e"));
    }
  }

}