import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/core/domain/validators/validator.dart';
import 'package:interview/core/presentation/widgets/custom_button.dart';
import 'package:interview/core/presentation/widgets/custom_textfield.dart';
import 'package:interview/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:interview/features/auth/presentation/login/screens/login_controller.dart';
import 'package:interview/features/home/presentation/screen/home_controller.dart';
import 'package:interview/managers/utils/abstract_controller.dart';
import 'package:interview/managers/utils/extensions/extension_on_num.dart';
import 'package:interview/managers/utils/palettes/colors.dart';
import 'package:interview/managers/utils/toast_manager.dart';

part 'signup_view.dart';

class SignupScreen extends StatefulWidget {
  static const String path = '/signup';
  static const String name = 'signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupController();
}

class _SignupController extends State<SignupScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// Method to register users when they have fill up all fields
  register() async {
    if (formKey.currentState!.validate()) {
      // ** by calling the context.read<AuthBloc> i am able to add the SignupEvent
      // ** which requires the parameters to be passed
      if (emailController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          firstNameController.text.isEmpty ||
          passwordController.text.isEmpty ||
          addressController.text.isEmpty) {
        ToastManager.short('Please fill all fields');
      } else {
        context.read<AuthBloc>().add(
              SignupEvent(
                firstName: firstNameController.text.trim(),
                lastName: lastNameController.text.trim(),
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
                address: addressController.text,
              ),
            );
      }
    }
  }

  loginPage() {
    context.goNamed(LoginScreen.name);
  }

  // ** If the User Login is complete and successful
  // ** this method displays a successful toast for 5seconds and navigate to the HomeScreen
  signupSuccess() async {
    ToastManager.short('Signup Complete').then(
      (value) => context.goNamed(HomeScreen.name),
    );
  }

  //  ** This method handles my signup error, this method can only be trigger if their is an
  //  ** error coming from firebase or internet connection
  signupError(String error) {
    Fluttertoast.showToast(msg: error, backgroundColor: DesignColors.kDarkRed);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _SignupView(this);
}
