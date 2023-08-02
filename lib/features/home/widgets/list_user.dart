import 'dart:convert';

import 'package:chat_app/features/chat/chat_page.dart';
import 'package:chat_app/features/home/controller/home_controller.dart';
import 'package:chat_app/features/home/repository/home_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListUser extends ConsumerStatefulWidget {
  const ListUser({super.key});

  @override
  ConsumerState createState() => _GroupListState();
}

class _GroupListState extends ConsumerState <ListUser> {
  //Stream? groups;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //init();
  }
  // init()async{
  //   groups = await HomeRepository().getUserGroup(FirebaseAuth.instance.currentUser!.uid);
  // }

  @override
  Widget build(BuildContext context) {
    final listUserStream = ref.watch(homeControllerProvider);
    return listUserStream.when(
        data: (data){
          return StreamBuilder(
              stream: data,
              builder: (context, snap){
                if(snap.hasData){
                  final DatabaseEvent data = snap.data;
                  final listUser = data.snapshot.children;
                  return ListView.builder(
                      itemCount: listUser.length,
                      itemBuilder: (context, index){
                        final itemValue = jsonDecode(jsonEncode(listUser.elementAt(index).value));
                        return Visibility(
                            visible: itemValue['uid'] != FirebaseAuth.instance.currentUser!.uid,
                            child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder:
                                          (context)=>ChatPage(
                                        receiverUserEmail: itemValue['email'],
                                        receiverUserId: itemValue['uid'],
                                      )
                                      )
                                  );
                                },
                                child: Text(itemValue['fullName'],)
                            )
                        );

                      }
                  );
                }
                if(snap.hasError){
                  return const Center(child: Text("error"),);
                }
                else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              });
        }, 
        error: (error,stack)=>const Text('error'),
        loading: () => const CircularProgressIndicator()
    );

  }
}
