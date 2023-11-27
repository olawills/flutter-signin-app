import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/features/auth/presentation/login/screens/login_controller.dart';
import 'package:interview/features/auth/presentation/signup/screens/signup_controller.dart';
import 'package:interview/features/home/presentation/screen/home_controller.dart';
import 'package:interview/features/splash/splash_controller.dart';

abstract class AppRouter {
  static final RouterConfig<Object> routerConfig = RouterConfig(
    routerDelegate: router.routerDelegate,
    backButtonDispatcher: router.backButtonDispatcher,
    routeInformationParser: router.routeInformationParser,
    routeInformationProvider: router.routeInformationProvider,
  );

  static GoRouter get router => _router;
}

GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
GlobalKey<NavigatorState> get _navigatorKey => GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: SplashScreen.path,
  debugLogDiagnostics: true,
  redirect: (BuildContext context, GoRouterState state) async {
    final user = FirebaseAuth.instance.currentUser;
    if (state.matchedLocation == LoginScreen.path) {
      if (user != null) {
        return HomeScreen.path;
      } else {
        return LoginScreen.path;
      }
    }
    return null;
  },
  routes: [
    GoRoute(
      path: SplashScreen.path,
      name: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: SignupScreen.path,
      name: SignupScreen.name,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
