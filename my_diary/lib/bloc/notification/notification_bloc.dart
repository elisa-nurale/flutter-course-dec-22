import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/bloc/notification/notification_event.dart';
import 'package:flutter_course_dec_22/bloc/notification/notification_state.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

_backgroundHandler(NotificationResponse response){
  print('sto usando il background handler');
}


@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState>{
  NotificationBloc() : super(const NotificationState.notInit()){
    on<NotificationInitialized>(_onNotificationInitialized);
  }

  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> _onNotificationInitialized(NotificationInitialized event, Emitter<NotificationState> emit) async{
     final settings = await firebaseMessaging.getNotificationSettings();
     if(settings.authorizationStatus == AuthorizationStatus.notDetermined || settings.authorizationStatus == AuthorizationStatus.denied){
       await firebaseMessaging.requestPermission();
     }
     await firebaseMessaging.setForegroundNotificationPresentationOptions(
       sound: true,
       alert: true,
       badge: true
     );

     print('FCM Token: ${await firebaseMessaging.getToken()}');

     const androidSettings = AndroidInitializationSettings('notification_icon');
     const iosSettings = DarwinInitializationSettings();
     const initializationSettings = InitializationSettings(iOS: iosSettings, android: androidSettings);

     flutterLocalNotificationsPlugin.initialize(initializationSettings,
         onDidReceiveBackgroundNotificationResponse: _backgroundHandler,
         onDidReceiveNotificationResponse: (NotificationResponse response){

           print('im inside flutterLocalNotificationsPlugin with onDidReceiveNotificationResponse response');
         }
     );

     const androidNotificationDetails = AndroidNotificationDetails(
         'diary_channel',
         'Diary notifications',
          priority: Priority.high
     );

     const notificationDetails = NotificationDetails(android: androidNotificationDetails);
     await flutterLocalNotificationsPlugin.periodicallyShow(
         0,
         'Inserisci la pagina di oggi!',
         'Non dimenticarti di scrivere i tuoi pensieri :)',
         RepeatInterval.everyMinute,
         notificationDetails
     );

/* const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'Inserisci la pagina di oggi!',
        'Non dimenticare di inserire la pagina di oggi!', RepeatInterval.everyMinute, notificationDetails,
        androidAllowWhileIdle: true);*/

     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
       print('Messaggio in foreground: ${message.data} || ${message.notification}');
     });
  }
}