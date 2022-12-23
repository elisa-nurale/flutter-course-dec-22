import 'package:equatable/equatable.dart';

enum NotificationStatus {notInitialized, initialized}

class NotificationState extends Equatable{
  final NotificationStatus status;
  const NotificationState._({required this.status});

  @override
  List<Object?> get props => [status];

  const NotificationState.notInitialized() : this._(status: NotificationStatus.notInitialized);

  const NotificationState.initialized() : this._(status: NotificationStatus.initialized);
}