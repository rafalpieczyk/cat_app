import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_page_cubit_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit()
      : super(const LoginPageState(errorMessage: '', isLogged: false));

  Future<void> start() async {
    emit(const LoginPageState(
      errorMessage: '',
      isLogged: false,
    ));
  }

  Future<void> login({
    required email,
    required password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(const LoginPageState(
        errorMessage: '',
        isLogged: true,
      ));
    } catch (error) {
      emit(const LoginPageState(
        errorMessage: 'Błąd logowania',
        isLogged: false,
      ));
    }
  }

  Future<void> signIn({
    required email,
    required password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(const LoginPageState(
        errorMessage: '',
        isLogged: true,
      ));
    } catch (error) {
      emit(const LoginPageState(
        errorMessage: 'Błąd rejestracji',
        isLogged: false,
      ));
    }
  }

  Future<void> signInwithGoogle({required credential}) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    emit(const LoginPageState(
      errorMessage: '',
      isLogged: true,
    ));
  }
}
