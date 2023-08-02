import 'package:chat_app/features/home/widgets/list_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ListUser(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add),),
    );
  }
}
