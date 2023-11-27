part of 'login_controller.dart';

class _LoginView extends StatelessView<LoginScreen, _LoginController> {
  const _LoginView(_LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            controller.loginSucess(state.user);
          }
          if (state is LoginError) {
            controller.loginError(state.error);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: [12, 20].pad,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login to Continue',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    30.sbh,
                    CustomTextField(
                      labelText: 'Email',
                      hintText: 'Enter email',
                      keyboardType: TextInputType.name,
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
                    20.sbh,
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomBtn(
                          text: state is LoginLoading
                              ? 'Signin in Progress'
                              : 'Signin',
                          textColor: Colors.white,
                          color: DesignColors.kDarkRed,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          loadingStatus: state is LoginLoading,
                          onTap: () => controller.login(),
                        );
                      },
                    ),
                    20.sbh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.grey,
                          width: MediaQuery.sizeOf(context).width * 0.28,
                          height: 2.h,
                        ),
                        const Text(
                          ' or continue with ',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: MediaQuery.sizeOf(context).width * 0.28,
                          height: 2.h,
                        ),
                      ],
                    ),
                    // ** Login with Google account
                    30.sbh,
                    GestureDetector(
                      onTap: () => controller.googleSignin(),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.08,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: DesignColors.kDarkRed,
                        ),
                        child: const Text(
                          'Signin with Google',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    30.sbh,
                    Center(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Don\'t have an account ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          TextSpan(
                            text: 'Signup',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => controller.signupPage(),
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
