import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_course_dec_22/bloc/notification/notification_event.dart';
import 'package:flutter_course_dec_22/bloc/notification/notification_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState>{
  final firebaseMessaging = FirebaseMessaging.instance;

  NotificationBloc() : super(const NotificationState.notInitialized()){
    print("NotificationBloc");
    on<NotificationInitialized>(_notificationInitialized);
  }

  Future<void> _notificationInitialized(NotificationInitialized event, Emitter<NotificationState> emit) async{
    print("_notificationInitialized");

    var notificationSettings = await firebaseMessaging.getNotificationSettings();
    if(notificationSettings.authorizationStatus == AuthorizationStatus.denied || notificationSettings.authorizationStatus == AuthorizationStatus.notDetermined){
      notificationSettings = await firebaseMessaging.requestPermission();
    }
    print("Notification state: ${notificationSettings.authorizationStatus}");
    print("TokenFCM: ${await firebaseMessaging.getToken()}");

    await firebaseMessaging.getInitialMessage();
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification!.title}');
      }
    });

    emit(const NotificationState.initialized());
  }
}