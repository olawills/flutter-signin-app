part of 'splash_controller.dart';

class _SplashView extends StatelessView<SplashScreen, SplashController> {
  const _SplashView(SplashController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    late final Animation<double> fadeInAnimation = CurvedAnimation(
        parent: controller.animationController, curve: Curves.easeIn);
    return Scaffold(
      body: SafeArea(
        child: Align(
          child: FadeTransition(
            opacity: fadeInAnimation,
            child: Text(
              'UI Test Interview',
              style: TextStyle(
                fontSize: 40.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
