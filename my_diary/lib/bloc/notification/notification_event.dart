import 'package:equatable/equatable.dart';

class NotificationEvent extends Equatable{
  const NotificationEvent();
  @override
  List<Object?> get props => [];
}

class NotificationInitialized extends NotificationEvent{}