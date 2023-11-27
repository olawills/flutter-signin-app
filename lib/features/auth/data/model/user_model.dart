import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email, password, lastName, firstName, address;
  const UserModel({
    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.address,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot map) => UserModel(
        email: map['email'],
        password: map['password'],
        lastName: map['lastName'],
        firstName: map['firstName'],
        address: map['address'],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'address': address,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        lastName = json['lastName'],
        firstName = json['firstName'],
        password = json['password'],
        address = json['address'];
}
