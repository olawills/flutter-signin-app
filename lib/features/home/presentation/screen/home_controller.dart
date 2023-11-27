import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:interview/features/auth/presentation/login/screens/login_controller.dart';
import 'package:interview/managers/utils/abstract_controller.dart';
import 'package:interview/managers/utils/extensions/extension_on_num.dart';
import 'package:interview/managers/utils/palettes/colors.dart';
import 'package:interview/managers/utils/toast_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_view.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home';
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeController();
}

class _HomeController extends State<HomeScreen> {
  final currentUser = User;
  final auth = FirebaseAuth.instance.currentUser;

  String firstName = '';
  String lastName = '';
  String email = '';
  String photoURL = '';
  String? address;
  String name = '';

  @override
  void initState() {
    super.initState();
    debugPrint(name);
    SharedPreferences.getInstance().then((pref) {
      setState(() {
        firstName = pref.getString('FirstName') ?? '';
        lastName = pref.getString('LastName') ?? '';
        email = pref.getString('Email') ?? '';
        photoURL = pref.getString('PhotoUrl') ?? '';
        address = pref.getString('Address') ?? '';
        name = pref.getString('Username') ?? '';
      });
    });
  }

  logout() async {
    context.read<AuthBloc>().add(LogoutEvent());
  }

  logoutSuccess() {
    Future.delayed(
        const Duration(seconds: 5),
        () => ToastManager.short('Sucessfully Logged out').then(
              (value) => context.goNamed(LoginScreen.name),
            ));
  }

  logoutError(String error) {
    Future.delayed(
      const Duration(seconds: 5),
      () => Fluttertoast.showToast(
          msg: error, backgroundColor: DesignColors.kDarkRed),
    );
  }

  @override
  Widget build(BuildContext context) => _HomeView(this);
}
