import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_page_cubit_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit()
      : super(const LoginPageState(errorMessage: '', isLogged: false));

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
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
}
