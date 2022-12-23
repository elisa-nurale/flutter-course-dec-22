import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/bloc/notification/notification_bloc.dart';
import 'package:flutter_course_dec_22/bloc/notification/notification_event.dart';
import 'package:flutter_course_dec_22/bloc/simple_bloc_observer.dart';
import 'package:flutter_course_dec_22/injection/injection.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';
import 'package:flutter_course_dec_22/router/router_guard.dart';
import 'package:firebase_core/firebase_core.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Notifica in backround!: $message");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyDiary());
}

class MyDiary extends StatelessWidget {
  MyDiary({Key? key}) : super(key: key);

  final _appRouter = AppRouter(/*authGuard: AuthGuard()*/);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotificationBloc>()..add(NotificationInitialized()),
      child: MaterialApp.router(
        title: 'My Diary',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}