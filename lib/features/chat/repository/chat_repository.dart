import 'package:chat_app/features/chat/model/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final chatRepositoryProvider = Provider((ref) => ChatRepository());
class ChatRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _realtimeDatabase = FirebaseDatabase.instance;

  Future<void> sendMessage(String receiverId, String message) async{
    //current info
      final String currentUserId = _auth.currentUser!.uid;
      final String currentUserEmail = _auth.currentUser!.email.toString();
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

      MessageModel messageModel = MessageModel(
          senderId: currentUserId,
          senderEmail: currentUserEmail,
          receiverId: receiverId,
          message: message,
          timestamp: timestamp
      );
      List<String> ids = [currentUserId,receiverId];
      ids.sort(); // this ensures the chat room id is always the same for any pair of people
      String chatroomId = ids.join("_"); //combine
      await _realtimeDatabase.ref('chat_rooms').child(chatroomId).child('messages').push().set(messageModel.toMap());
  }

  Future<Stream> getMessage(String userId, String otherUserId)async{
    List<String> ids = [userId,otherUserId];
    ids.sort(); // this ensures the chat room id is always the same for any pair of people
    String chatroomId = ids.join("_"); //combine
    return _realtimeDatabase.ref("chat_rooms").child(chatroomId).child('messages').onValue;
  }

}