

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const VOTES = "votes";
  static const TRIPS = "trips";
  static const RATING = "rating";
  static const TOKEN = "token";

  String? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _token;

  int? _votes;
  int? _trips;
  double? _rating;

  // 🔹 Construtor com parâmetros
  UserModel(this._id, this._name, this._email, this._phone, this._token,
      this._votes, this._trips, this._rating);

  // 🔹 Construtor vazio
  UserModel.empty();

  // Getters
  String get name => _name ?? '';
  String get email => _email ?? '';
  String get id => _id ?? '';
  String get token => _token ?? '';
  String get phone => _phone ?? '';
  int get votes => _votes ?? 0;
  int get trips => _trips ?? 0;
  double get rating => _rating ?? 0.0;

  // 🔹 Construtor a partir do Firestore
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    _name = data[NAME];
    _email = data[EMAIL];
    _id = data[ID];
    _token = data[TOKEN];
    _phone = data[PHONE];
    _votes = data[VOTES];
    _trips = data[TRIPS];
    _rating = (data[RATING] as num?)?.toDouble(); // conversão segura
  }
}
