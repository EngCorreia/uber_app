
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

abstract class ISystemLocaleRepository {
  Future<Either<Failure, Locale?>> locale(String? params);
}
