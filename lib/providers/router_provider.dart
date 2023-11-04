import 'dart:async';

import 'package:kadu_ngo/providers/login_controller_provider.dart';
import 'package:kadu_ngo/providers/states/login_states.dart';
// import 'package:kadu_ngo/screens/signin/.dart';
import 'package:kadu_ngo/screens/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadu_ngo/screens/splash/splash.dart';

final routerProvider = Provider<GoRouter>((ref) {
  FutureOr<String?> router = RouterNotifier(ref) as FutureOr<String?>;
  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      redirect: router?._redirectLogic,
      routes: router?._routes);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<LoginState>(
      loginControllerProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(GoRouterState state) {
    final loginState = _ref.read(loginControllerProvider);

    final areWeLoggingIn = state.path == '/login';

    if (loginState is LoginStateInitial) {
      return areWeLoggingIn ? null : '/login';
    }

    if (areWeLoggingIn) return '/';

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          name: 'login',
          builder: (context, state) => const SignInScreen(),
          path: '/login',
        ),
        GoRoute(
          name: 'home',
          builder: (context, state) => SplashScreen(),
          path: '/',
        ),
      ];
}
