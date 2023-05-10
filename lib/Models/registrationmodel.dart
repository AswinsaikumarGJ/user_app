import 'package:flutter/material.dart';

class RegistrationModel {
 String id;
    String name;
  late String email;
  late String age;
  late String password;
  RegistrationModel({
     this.id = "",
     this.name = "",
    this.email = "",
    this.age = "",
    this.password = "",
  });
 Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'age' : age,
    'password' : password
 };
 static RegistrationModel fromJson(Map<String,dynamic>json) => RegistrationModel(
  id: json["id"],
  name: json["name"], 
  email: json["email"], 
  age: json["age"], 
  password: json["password"]
  );
}
