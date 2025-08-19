import 'package:cloud_firestore/cloud_firestore.dart';

class RideRequestModel {
 // Constantes para os nomes dos campos
 static const String ID = "id";
 static const String USERNAME = "username";
 static const String USER_ID = "userId";
 static const String DRIVER_ID = "driverId";
 static const String STATUS = "status";
 static const String POSITION = "position";
 static const String DESTINATION = "destination";

 // Variáveis privadas
 String? _id;
 String? _username;
 String? _userId;
 String? _driverId;
 String? _status;
 Map? _position;
 Map? _destination;

 // Getters
 String get id => _id!;
 String get username => _username!;
 String get userId => _userId!;
 String get driverId => _driverId!;
 String get status => _status!;
 Map get position => _position!;
 Map get destination => _destination!;

 // Construtor a partir de snapshot do Firebase
 RideRequestModel.fromSnapshot(DocumentSnapshot snapshot) {
  final data = snapshot.data() as Map<String, dynamic>;

  _id = data[ID];
  _username = data[USERNAME];
  _userId = data[USER_ID];
  _driverId = data[DRIVER_ID];
  _status = data[STATUS];
  _position = data[POSITION];
  _destination = data[DESTINATION];
 }
}
