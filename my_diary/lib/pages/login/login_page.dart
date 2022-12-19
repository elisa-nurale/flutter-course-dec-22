import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_dec_22/globals/globals.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MyDiary', style: Theme.of(context).textTheme.displayMedium),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                label: Text('User')
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('Password')
              ),
              obscureText: true,
            ),
            Row(
              children: [
                TextButton(
                  child: const Text('Crea utente'),
                  onPressed: () async {
                    await storage.write(key: _userController.text, value: _passwordController.text);
                  },
                ),
                TextButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    final pw = await storage.read(key: _userController.text);
                    if(_passwordController.text == pw){
                      await storage.write(key: 'loggedIn', value: _userController.text);
                      context.router.push(DiaryListRoute());
                    }
                    else{
                      showDialog(context: context, builder: (context){
                        return const AlertDialog(content: Text('Username o password errati'),);
                      });
                    }
                  },
                )
              ],
            ),
        ],),
      ),
    );
  }
}
