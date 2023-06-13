import 'package:cat_app/app/home/home_page.dart';
import 'package:cat_app/app/login/login_page.dart';
import 'package:cat_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'main.dart';

@injectable
class CatRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: StartPage());
        },
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: HomePage(
              user: getIt(),
            ),
          );
        },
      ),
    ],
  );
}
