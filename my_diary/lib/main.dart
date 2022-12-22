import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/bloc/simple_bloc_observer.dart';
import 'package:flutter_course_dec_22/injection/injection.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';
import 'package:flutter_course_dec_22/router/router_guard.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyDiary());
}

class MyDiary extends StatelessWidget {
  MyDiary({Key? key}) : super(key: key);

  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {

    print(Firebase.app().name);

    return MaterialApp.router(
      title: 'My Diary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}