import 'package:equatable/equatable.dart';

enum NotificationStatus {notInit, init}

class NotificationState extends Equatable{
  final NotificationStatus status;
  const NotificationState._({required this.status});

  @override
  List<Object?> get props => [status];

  const NotificationState.init() : this._(status: NotificationStatus.init);
  const NotificationState.notInit() : this._(status: NotificationStatus.notInit);
}