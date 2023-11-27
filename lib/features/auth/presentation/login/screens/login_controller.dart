import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/core/domain/validators/validator.dart';
import 'package:interview/core/presentation/widgets/custom_button.dart';
import 'package:interview/core/presentation/widgets/custom_textfield.dart';
import 'package:interview/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:interview/features/auth/data/datasource/remote/auth_datasource.dart';
import 'package:interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:interview/features/auth/presentation/signup/screens/signup_controller.dart';
import 'package:interview/features/home/presentation/screen/home_controller.dart';
import 'package:interview/managers/utils/abstract_controller.dart';
import 'package:interview/managers/utils/extensions/extension_on_num.dart';
import 'package:interview/managers/utils/palettes/colors.dart';
import 'package:interview/managers/utils/toast_manager.dart';

part 'login_view.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/login';
  static const String name = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginController();
}

class _LoginController extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthDataSourceImpl auth = AuthDataSourceImpl();

  login() async {
    if (formKey.currentState!.validate()) {
      // ** by calling the context.read<AuthBloc> i am able to add the SignupEvent
      // ** which requires the parameters to be passed
      context.read<AuthBloc>().add(
            LoginEvent(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
    }
  }

  // ** If the User Login is complete and successful
  // ** this method displays a successful toast for 5seconds and navigate to the HomeScreen
  loginSucess(User user) async {
    await LocalDataStorage.instance.setUserInfo(user);
    ToastManager.short('User Succesfully Logged in').then(
      (value) => context.goNamed(HomeScreen.name),
    );
  }

  googleSignin() async {
    auth.googleSignin().whenComplete(
          () => context.goNamed(HomeScreen.name),
        );
  }

  //  ** This method handles my login error, this method can only be trigger if their is an
  //  ** error coming from firebase or internet connection
  loginError(String error) {
    Fluttertoast.showToast(msg: error, backgroundColor: DesignColors.kDarkRed);
  }

  signupPage() {
    context.pushNamed(SignupScreen.name);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _LoginView(this);
}
