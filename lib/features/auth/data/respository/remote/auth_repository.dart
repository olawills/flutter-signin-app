import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview/features/auth/data/datasource/remote/auth_datasource.dart';
import 'package:interview/features/auth/presentation/bloc/auth_bloc.dart';

class AuthRepository {
  AuthRepository({AuthDataSource? authRemoteDataSource})
      : _authDataSourceImpl = authRemoteDataSource ?? AuthDataSourceImpl();
  final AuthDataSource _authDataSourceImpl;

  Future<User> signupUser(SignupEvent event) async {
    try {
      final auth = await _authDataSourceImpl.signup(event);
      return auth;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<User> loginUser(LoginEvent event) async {
    try {
      final auth = await _authDataSourceImpl.login(event);
      return auth;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> logoutUser(LogoutEvent event) async {
    try {
      await _authDataSourceImpl.signout(event);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
