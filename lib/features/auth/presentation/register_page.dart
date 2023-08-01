
 import 'package:chat_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:chat_app/features/auth/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
 ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';

  String _email = '';

  String _password = '';

   @override
  Widget build(BuildContext context) {
     final register = ref.watch(authControllerProvider);
    return register.when(data: (data)=>
        Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Tên'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập tên của bạn';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập email của bạn';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Mật khẩu'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập mật khẩu của bạn';
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
                         final resultRegister = await ref.read(authControllerProvider.notifier).register(_name, _email, _password);
                         if(resultRegister){
                           if(mounted){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage()));
                           }
                         }
                      }
                    },
                    child: const Text('Đăng ký'),
                  ),
                ],
              ),
            ),
          ),
        )
        , error: (error,stack) => const Text("error"), loading: () => const Center(child: CircularProgressIndicator()));

  }
}