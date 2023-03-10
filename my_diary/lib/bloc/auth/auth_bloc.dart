import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/bloc/auth/auth_event.dart';
import 'package:flutter_course_dec_22/bloc/auth/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState>{
   AuthBloc() : super(const AuthState.init()){
    on<AuthInit>(_onAuthInit);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<NewAccountCreated>(_onNewAccountCreated);
  }
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> _onAuthInit(AuthInit event, Emitter<AuthState> emit) async{
    firebaseAuth.currentUser == null
        ? emit(const AuthState.unauth())
        : emit(AuthState.auth(firebaseAuth.currentUser!));
  }

  Future<void> _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: event.email, password: event.password);
      emit(AuthState.auth(firebaseAuth.currentUser!));
    } catch(e){
      emit(AuthState.error(e.toString()));
      emit(const AuthState.unauth());
    }
  }

  Future<void> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async{
    await firebaseAuth.signOut();
    emit(const AuthState.unauth());
  }

  Future<void> _onNewAccountCreated(NewAccountCreated event, Emitter<AuthState> emit) async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: event.email, password: event.password);
      firebaseAuth.currentUser == null
          ? emit(const AuthState.unauth())
          : emit(AuthState.auth(firebaseAuth.currentUser!));
    } catch(e){
      emit(AuthState.error(e.toString()));
      emit(const AuthState.unauth());
    }
  }
}