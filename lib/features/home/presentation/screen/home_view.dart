part of 'home_controller.dart';

class _HomeView extends StatelessView<HomeScreen, _HomeController> {
  const _HomeView(_HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogoutSucess) {
          controller.logoutSuccess();
        }
        if (state is LogoutError) {
          controller.logoutError(state.error);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                controller.auth?.photoURL != null
                    ? CircleAvatar(
                        radius: 80.r,
                        backgroundImage:
                            NetworkImage(controller.auth?.photoURL ?? ''),
                      )
                    : const SizedBox.shrink(),
                20.sbh,
                const Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                10.sbh,
                //  ** This might not work for when u log in
                controller.auth?.displayName != null
                    ? Text(
                        controller.auth?.displayName ?? controller.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        '${controller.firstName} ${controller.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                20.sbh,
                const Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                10.sbh,
                Text(
                  controller.auth?.email ?? controller.email,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                10.sbh,
                // controller.address != null
                //     ? Column(
                //         children: [
                //           const Text(
                //             'House Address',
                //             style: TextStyle(
                //               fontSize: 20,
                //               color: Colors.black,
                //             ),
                //           ),
                //           10.sbh,
                //           Text(
                //             controller.address!,
                //             style: const TextStyle(
                //               fontSize: 18,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ],
                //       )
                //     : const SizedBox.shrink(),
                20.sbh,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () => controller.logout(),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: MediaQuery.sizeOf(context).height * 0.06,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Sign out',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
