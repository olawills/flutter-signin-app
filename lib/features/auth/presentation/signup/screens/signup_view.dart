part of 'signup_controller.dart';

class _SignupView extends StatelessView<SignupScreen, _SignupController> {
  const _SignupView(_SignupController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            controller.signupSuccess();
          }
          if (state is SignupError) {
            controller.signupError(state.error);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: [10, 12].pad,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const Text(
                      'Register to Open the App',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    30.sbh,
                    CustomTextField(
                      labelText: 'First Name',
                      hintText: 'Enter first name',
                      keyboardType: TextInputType.name,
                      inputController: controller.firstNameController,
                      validator: Validator().name,
                      isValidationMessage: true,
                    ),
                    10.sbh,
                    CustomTextField(
                      labelText: 'Last Name',
                      hintText: 'Enter last name',
                      keyboardType: TextInputType.name,
                      inputController: controller.lastNameController,
                      validator: Validator().lastName,
                      isValidationMessage: true,
                    ),
                    10.sbh,
                    CustomTextField(
                      labelText: 'Email',
                      hintText: 'Enter email',
                      keyboardType: TextInputType.emailAddress,
                      inputController: controller.emailController,
                      validator: Validator().email,
                      isValidationMessage: true,
                    ),
                    10.sbh,
                    CustomTextField(
                      labelText: 'Password',
                      hintText: 'Enter Passwod',
                      keyboardType: TextInputType.text,
                      suffixIcon: true,
                      inputController: controller.passwordController,
                      validator: Validator().password,
                    ),
                    CustomTextField(
                      labelText: 'Enter Address',
                      hintText: 'Enter your address',
                      keyboardType: TextInputType.streetAddress,
                      inputController: controller.addressController,
                      validator: Validator().address,
                      isValidationMessage: true,
                    ),
                    10.sbh,
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomBtn(
                          text: state is SignupLoading
                              ? 'Registration in Progress'
                              : 'Register',
                          textColor: Colors.white,
                          color: DesignColors.kDarkRed,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          loadingStatus: state is SignupLoading,
                          onTap: () => controller.register(),
                        );
                      },
                    ),
                    20.sbh,
                    Center(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Already Have an account ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'Signin',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => controller.loginPage(),
                            style: const TextStyle(
                              color: DesignColors.kDarkRed,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
