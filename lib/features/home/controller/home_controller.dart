import 'package:chat_app/features/home/repository/home_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';
@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<Stream?> build() async {
    return await ref.read(homeRepositoryProvier).getUserGroup(FirebaseAuth.instance.currentUser!.uid);
  }

}
