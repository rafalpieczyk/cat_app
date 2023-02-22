import 'package:cat_app/app/login/login_page.dart';
import 'package:cat_app/app/home/default_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId: 'catapp123',
  );
  runApp(MyApp(googleSignIn: googleSignIn));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  GoogleSignIn googleSignIn;

  MyApp({required this.googleSignIn, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        googleSignIn: googleSignIn,
      ),
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [
        Locale('en'),
        Locale('pl'),
      ],
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  GoogleSignIn googleSignIn;
  HomePage({
    required this.googleSignIn,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user == null) {
          return LoginPage(
            googleSignIn: googleSignIn,
          );
        }
        return DefaultPage(user: user);
      },
    );
  }
}
