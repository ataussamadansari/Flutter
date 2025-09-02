import 'package:bloc_state_management/bloc/auth/auth_event.dart';
import 'package:bloc_state_management/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(): super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());

      await Future.delayed(Duration(seconds: 3));
      String email = event.email;
      String password = event.password;

      if(email == "test@gmail.com" && password == "123456") {
        emit(AuthSuccessState());
      } else {
        emit(AuthFailureState("Invalid email or password"));
      }
    });
  }
}