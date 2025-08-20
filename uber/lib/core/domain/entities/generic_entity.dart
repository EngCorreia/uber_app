
import 'package:equatable/equatable.dart';

class GenericEntity extends Equatable {
  const GenericEntity({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

class GenericModel extends GenericEntity {
  const GenericModel({required super.message});
  factory GenericModel.fromJson(Map<String, dynamic> json) =>
      GenericModel(message: json['message']);
}

