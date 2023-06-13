import 'package:cat_app/app/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';

class CatRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginPage());
        },
      ),
      // GoRoute(
      //   path: '/default',
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(
      //         child: DefaultPage(
      //       user: user,
      //     ));
      //   },
      // ),
    ],
  );
}
