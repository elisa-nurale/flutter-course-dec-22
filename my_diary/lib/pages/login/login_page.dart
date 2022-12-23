import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_dec_22/bloc/auth/auth_event.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previuousAuthState, currentAuthState){
          return currentAuthState.status == AuthStatus.auth || currentAuthState.status == AuthStatus.error;
        },
        listener: (context, authState) {
          if(authState.status == AuthStatus.auth) {
            context.router.push(const DiaryPagesWrapper());
          }
          if(authState.status == AuthStatus.error){
            showDialog(context: context, builder: (context) => AlertDialog(
              title: const Text('Errore'),
              content: Text(authState.error ?? ''),
            ));
          }
        },
        builder: (context, authState) {
          if(authState.status == AuthStatus.init){
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('MyDiary', style: Theme.of(context).textTheme.displayMedium),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(label: Text('Email')),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(label: Text('Password')),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        child: const Text('Crea utente'),
                        onPressed: () async {
                          context.read<AuthBloc>().add(NewAccountCreated(email: _emailController.text, password: _passwordController.text));
                         /* await storage.write(
                              key: _userController.text, value: _passwordController.text);*/
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () async {
                          context.read<AuthBloc>().add(LoggedIn(email: _emailController.text, password: _passwordController.text));
                          /*final pw = await storage.read(key: _emailController.text);
                          if (_passwordController.text == pw) {
                            await storage.write(key: 'loggedIn', value: _emailController.text);
                            context.router.push(const DiaryPagesWrapper());
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text('Username o password errati'),
                                  );
                                });
                          }*/
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
