import 'package:chat_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:chat_app/features/auth/presentation/register_page.dart';
import 'package:chat_app/features/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState createState() => _LoginPageState();
}
 class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

   @override
  Widget build(BuildContext context) {
     final authController = ref.watch(authControllerProvider);
    return authController.when(data: (data)=>
        Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final resultLogin = await ref.read(authControllerProvider.notifier).login(_email, _password);
                        if(resultLogin){
                          if(mounted){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));
                          }
                        }
                      }
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RegisterPage()));
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        )
        , error: (error,stack) => const Text("error"), loading: () => const Center(child: CircularProgressIndicator()));
  }
}