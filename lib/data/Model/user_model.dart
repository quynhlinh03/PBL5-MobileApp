import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'data_model.dart';

class Users {

  final String userID;
  final String? name;
  late final String email;
  late final String password;
  final List<Data> data;
  Users({
    required this.userID,
    this.name,
    required this.email,
    required this.password,
    required this.data,
  });

 

  Users copyWith({
    String? userID,
    String? name,
    String? email,
    String? password,
    List<Data>? data,
  }) {
    return Users(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'password': password,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userID: map['userID'] ?? '',
      name: map['name'] ?? '',
      email: map['email']?? '',
      password: map['password'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Users(userID: $userID, name: $name, email: $email, password: $password, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Users &&
      other.userID == userID &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return userID.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      data.hashCode;
  }
}
