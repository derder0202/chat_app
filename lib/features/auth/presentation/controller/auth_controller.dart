import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/auth_repository.dart';
part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<bool?> build() async {
    return null;
  }
  Future<bool> register (String fullName,String email,String password) async{
    state = const AsyncLoading();
    final result = await ref.read(authRepositoryProvider).register(fullName, email, password);
    if(result){
      state = AsyncData(result);
      return true;
    }
    state = AsyncError(result, StackTrace.current);
    return false;
  }

  Future<bool> login(String email,String password) async{
    state = const AsyncLoading();
    final result = await ref.read(authRepositoryProvider).login(email, password);
    if(result){
      state = AsyncData(result);
      return true;
    }
    state = AsyncError(result, StackTrace.current);
    return false;
  }


}
