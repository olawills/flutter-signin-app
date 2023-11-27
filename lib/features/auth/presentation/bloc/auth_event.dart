part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignupEvent extends AuthEvent {
  final String firstName, lastName, email, password, address;

  const SignupEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.address,
  });
}

class LoginEvent extends AuthEvent {
  final String email, password;

  const LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthEvent {}
