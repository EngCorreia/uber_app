

import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:interfaces/interfaces.dart';

import '../repositories/system_locale_repository.dart';

class SystemLocaleUsecase implements Usecase<Locale?, String?> {
  SystemLocaleUsecase(this.repository);
  final ISystemLocaleRepository repository;
  @override
  Future<Either<Failure, Locale?>> call(String? params) async {
    return await repository.locale(params);
  }
}
