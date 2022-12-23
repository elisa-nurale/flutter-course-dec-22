import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {init, auth, unauth, error}

class AuthState extends Equatable{
  final AuthStatus status;
  final User? user;
  final String? error;
  const AuthState._({required this.status, this.user, this.error});

  @override
  List<Object?> get props => [status, user, error];

  const AuthState.init() : this._(status: AuthStatus.init);
  const AuthState.auth(User user) : this._(status: AuthStatus.auth, user: user);
  const AuthState.unauth() : this._(status: AuthStatus.unauth);
  const AuthState.error(String error) : this._(status: AuthStatus.error, error: error);
}