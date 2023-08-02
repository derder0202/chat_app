
import 'dart:convert';

import 'package:chat_app/features/chat/controller/chat_controller.dart';
import 'package:chat_app/features/chat/model/message_model.dart';
import 'package:chat_app/features/chat/repository/chat_repository.dart';
import 'package:chat_app/features/chat/widgets/item_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageList extends ConsumerStatefulWidget {
  const MessageList({super.key, required this.receiverUserEmail, required this.receiverUserId});
  final String receiverUserEmail;
  final String receiverUserId;
  @override
  ConsumerState<MessageList> createState() => _MessageListState();
}

class _MessageListState extends ConsumerState<MessageList> {
  Stream? messages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init()async{
    messages =await ChatRepository().getMessage(widget.receiverUserId, FirebaseAuth.instance.currentUser!.uid);
  }
  @override
  Widget build(BuildContext context) {
    final chatMessageStream = ref.watch(chatControllerProvider(widget.receiverUserId, FirebaseAuth.instance.currentUser!.uid));
    return chatMessageStream.when(
        data: (data){
          return StreamBuilder(
              stream: data,
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return const Text("error");
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }

                final DatabaseEvent data = snapshot.data!;
                print(data.snapshot.toString());
                print( data.snapshot.value);
                final listMessage = data.snapshot.children;
                print(listMessage.length);
                return ListView.builder(
                    itemCount: listMessage.length,
                    itemBuilder: (context,index){
                      final itemValue = jsonDecode(jsonEncode(listMessage.elementAt(index).value));
                      return ItemMessage(data: itemValue);
                    }
                );
              }
          );
        },
        error: (error,stack)=>Text("error"),
        loading: ()=>CircularProgressIndicator()
    );


  }
}
