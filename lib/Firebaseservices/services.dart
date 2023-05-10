import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_app/Models/registrationmodel.dart';

class FireServices {
  //creating users data
  createUser(RegistrationModel user) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json).whenComplete(() {
     return "Registered Successfully";
      }
    ).catchError((error,StackTrace){
      return "Error";
    });
  }

  //getting users data
  Stream<List<RegistrationModel>> readUser() =>
     FirebaseFirestore.instance.collection('Users').snapshots().map((event) => event.docs.map
    ((doc) => RegistrationModel.fromJson(doc.data())).toList());

  //update users data
  updateUser(RegistrationModel user) {
    final docUser = FirebaseFirestore.instance.collection('Users').doc('${user.id}');
    docUser.update({
      'name': user.name,
      'age' : user.age,
      'email' : user.email,
      'password' : user.password
    });
  }

  //registering users
  registeruser(RegistrationModel user) async {
    final docUser = FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password).whenComplete(() => {
      print("Registered Successfully")
    }).catchError((err,StackTrace){
      print(err);
    });
  }

 //login users
  loginuser(RegistrationModel user) async {
    final docUser = FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password).whenComplete(() => {
      print("Logged in Successfully")
    }).catchError((err,StackTrace){
      print(err);
    });
  }

}