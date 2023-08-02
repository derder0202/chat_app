import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final authRepositoryProvider = Provider((ref) => AuthRepository());
class AuthRepository{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

  //AuthRepository({required this.realtimeDatabase});

  Future<bool> register(String fullName, String email, String password)async{
    try{
      User? user = (await auth.createUserWithEmailAndPassword(email: email, password: password)).user;
      if(user != null){
        await realtimeDatabase.ref("users").child(user.uid).set({
          "fullName": fullName,
          "email" : email,
          "group" : [],
          "uid" : user.uid
        });
        return true;
      }
      return false;
    } on FirebaseAuthException catch(e){
      print(e.message);
      return false;
    }
  }

  Future<bool> login(String email, String password)async{
    try{
      User? user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
      if(user != null){
        return true;
      }
      return false;
    } on FirebaseAuthException catch(e){
      print(e.message);
      return false;
    }
  }


}