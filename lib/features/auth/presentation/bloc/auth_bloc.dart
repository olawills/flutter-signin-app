import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/features/auth/data/respository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepoImpl = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<SignupEvent>((event, emit) => _signup(event, emit));
    on<LoginEvent>((event, emit) => _login(event, emit));
    on<LogoutEvent>((event, emit) => _logout(event, emit));
  }

  _signup(SignupEvent event, emit) async {
    emit(SignupLoading());
    final response = await _authRepoImpl.signupUser(event);
    response.fold((l) => emit(SignupError(error: l)),
        (r) => emit(SignupSuccess(user: r)));
  }

  _login(LoginEvent event, emit) async {
    emit(LoginLoading());
    final response = await _authRepoImpl.loginUser(event);
    response.fold(
      (l) => emit(LoginError(error: l)),
      (r) => emit(
        LoginSuccess(user: r),
      ),
    );
  }

  _logout(LogoutEvent event, emit) async {
    emit(LogoutLoading());
    final response = await _authRepoImpl.logoutUser(event);
    response.fold(
      (l) => emit(LogoutError(error: l)),
      (r) => emit(
        LogoutSucess(),
      ),
    );
  }
}
