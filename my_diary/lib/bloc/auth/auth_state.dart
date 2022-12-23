import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {init, unauth, auth, error}

class AuthState extends Equatable{
  final AuthStatus status;
  final User? user;
  final String? error;
  const AuthState._({required this.status, this.user, this.error});

  const AuthState.initial() : this._(status: AuthStatus.init);
  const AuthState.authenticated(User user) : this._(status: AuthStatus.auth);
  const AuthState.unauthenticated() : this._(status: AuthStatus.unauth);
  const AuthState.error(String error) : this._(status: AuthStatus.error, error: error);

  @override
  List<Object?> get props => [status];
}