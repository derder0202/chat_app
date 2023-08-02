
import 'package:chat_app/features/chat/widgets/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ItemMessage extends StatelessWidget {
  const ItemMessage({super.key, required this.data});
  final Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    var alignment = (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)?
    Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: data['senderId'] == FirebaseAuth.instance.currentUser!.uid? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: data['senderId'] == FirebaseAuth.instance.currentUser!.uid? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Text(data['senderEmail']),
          ChatBubble(message: data['message'],color: data['senderId'] == FirebaseAuth.instance.currentUser!.uid?Colors.blue:Colors.black26,)
        ],
      ),
    );
  }
}
