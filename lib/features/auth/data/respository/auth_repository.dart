import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview/features/auth/data/datasource/remote/auth_datasource.dart';
import 'package:interview/features/auth/presentation/bloc/auth_bloc.dart';

class AuthRepository {
  AuthRepository({AuthDataSource? authRemoteDataSource})
      : _authDataSourceImpl = authRemoteDataSource ?? AuthDataSourceImpl();
  final AuthDataSource _authDataSourceImpl;

  Future<Either<String, User>> signupUser(SignupEvent event) async {
    try {
      final auth = await _authDataSourceImpl.signup(event);
      return Right(auth);
    } on FirebaseAuthException catch (e) {
      return Left(e.message!);
    } on SocketException catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, User>> loginUser(LoginEvent event) async {
    try {
      final auth = await _authDataSourceImpl.login(event);
      return Right(auth);
    } on FirebaseAuthException catch (e) {
      return Left(e.message!);
    } on SocketException catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, void>> logoutUser(LogoutEvent event) async {
    try {
      final response = await _authDataSourceImpl.signout(event);
      return Right(response);
    } on FirebaseAuthException catch (e) {
      return Left(e.message!);
    } on SocketException catch (e) {
      return Left(e.message);
    }
  }
}
