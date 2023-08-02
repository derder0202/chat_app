import 'package:chat_app/features/chat/repository/chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_controller.g.dart';
@riverpod
class ChatController extends _$ChatController {
  @override
  FutureOr<Stream?> build(String userId, String otherUserId) async {
    return await ref.read(chatRepositoryProvider).getMessage(userId, otherUserId);
  }

  Future<void> sendMessage(String receiverId, String message)async{
    await ref.read(chatRepositoryProvider).sendMessage(receiverId, message);
  }
}
