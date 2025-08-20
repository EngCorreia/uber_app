import 'dart:convert';
import 'package:errors/errors.dart';
import 'package:local/local.dart';
import '../../../../../core/data/models/user_information_model.dart';
import '../../../../../core/domain/entities/user_information_entity.dart';
import 'authenticated_user_datasource.dart';

class AuthenticatedUserDatasourceImplementation implements IAuthenticatedUserDatasource{
  AuthenticatedUserDatasourceImplementation(this.local);

  final ILocalStorage local;

  @override
  Future<UserInformationEntity> get() async{
    try{       
      final result = await local.get(key: "auth");

      if(result != null){
        var data = jsonDecode(result);
        return UserInformationModel.fromMap(data);  
      }else{
        return UserInformationModel.empty();
      }
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<bool> remove() async {
    try{
      final result = await local.delete(key: "auth");
      if(result == false){
        throw const CachedException("Erro ao remover os dados");
      }else{
        return result;
      }
    }catch(e){
      rethrow;
    }
  }
  

  @override
  Future<bool> saveStore(UserInformationEntity user) async {
   try{
    var value = UserInformationModel.convert(user: user);
    final result = await local.put(key: "auth", value: jsonEncode(value));
    if(result == false){
      throw const CachedException("Erro ao inserir dados do usuario");
    }else{
      return result;
    }
   }catch(e){
    rethrow;
   }
  }

  @override
  Future<bool> updateStore(UserInformationEntity user) async {
    try{
      var value = UserInformationModel.userUpdate(user: user);
      final result = await local.put(key: "auth", value: jsonEncode(value));
      if(result == false){
        throw const CachedException("Erro ao inserir dados do usuario");
      }else{
        return result;
      }
    }catch(e){
      rethrow;
    }
  }

}