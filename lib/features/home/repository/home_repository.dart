
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvier = Provider((ref) => HomeRepository());
class HomeRepository{
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

  Future<Stream> getUserGroup(String uid) async{
    return realtimeDatabase.ref("users").onValue;
  }

}