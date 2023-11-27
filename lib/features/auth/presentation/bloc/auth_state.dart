part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticationLoading extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final User user;
  const LoginSuccess({required this.user});
}

class LoginError extends AuthState {
  final String error;
  const LoginError({required this.error});
}

class SignupLoading extends AuthState {}

class SignupError extends AuthState {
  final String error;
  const SignupError({required this.error});
}

class SignupSuccess extends AuthState {
  final User user;
  const SignupSuccess({required this.user});
}

class LogoutLoading extends AuthState {}

class LogoutSucess extends AuthState {}

class LogoutError extends AuthState {
  final String error;
  const LogoutError({required this.error});
}
