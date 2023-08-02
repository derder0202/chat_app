
import 'package:chat_app/features/chat/repository/chat_repository.dart';
import 'package:chat_app/features/chat/widgets/message_list.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.receiverUserEmail, required this.receiverUserId});
  final String receiverUserEmail;
  final String receiverUserId;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverUserEmail),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: MessageList(receiverUserEmail: widget.receiverUserEmail, receiverUserId: widget.receiverUserId)),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: "enter message"
                      ),
                    )
                ),
                IconButton(onPressed: ()async{
                  if(_messageController.text.isNotEmpty){
                    await ChatRepository().sendMessage(widget.receiverUserId, _messageController.text);
                    _messageController.clear();
                  }
                }, icon: const Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
