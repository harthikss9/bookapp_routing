import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticationState { loggedIn, notLoggedIn }

class AuthenticationBloc extends Cubit<AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.notLoggedIn);

  String _username = '';
  String get username => _username;

  void logIn(String username) {
    _username = username;
    emit(AuthenticationState.loggedIn);
  }

  void logOut() {
    _username = '';
    emit(AuthenticationState.notLoggedIn);
  }
}
