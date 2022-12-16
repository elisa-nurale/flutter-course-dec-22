import 'package:flutter/material.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';
import 'package:flutter_course_dec_22/router/router_guard.dart';

void main() {
  runApp(MyDiary());
}

class MyDiary extends StatelessWidget {
  MyDiary({Key? key}) : super(key: key);

  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
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