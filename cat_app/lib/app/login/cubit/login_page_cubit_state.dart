// ignore_for_file: prefer_typing_uninitialized_variables

part of 'login_page_state.dart';

@immutable
class LoginPageState {
  final errorMessage;
  final bool isLogged;

  const LoginPageState({required this.errorMessage, required this.isLogged});
}
