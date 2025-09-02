import 'package:cubit/cubit/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void login(String email, String password) async {
    emit(AuthLoadingState());

    await Future.delayed(Duration(seconds: 2));

    if(email == "test@gmail.com" && password == "123456") {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Invalid email or password"));
    }
  }
}