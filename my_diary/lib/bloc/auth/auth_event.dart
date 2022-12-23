import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthInit extends AuthEvent{}

class LoggedIn extends AuthEvent{
  final String email;
  final String password;
  const LoggedIn({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoggedOut extends AuthEvent{}

class NewAccountCreated extends AuthEvent{
  final String email;
  final String password;

  const NewAccountCreated({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}