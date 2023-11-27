import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/features/auth/presentation/login/screens/login_controller.dart';
import 'package:interview/managers/utils/abstract_controller.dart';

part 'splash_view.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/';
  static const String name = 'startup';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashController();
}

class SplashController extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2500),
  );

  _startDelay() {
    animationController.forward().whenComplete(() {
      // if (user != null) {
      //   context.goNamed(HomeScreen.name);
      // } else {
      //   context.goNamed(LoginScreen.name);
      // }
      context.goNamed(LoginScreen.name);
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _SplashView(this);
}
