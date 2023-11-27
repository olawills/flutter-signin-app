import 'package:get_it/get_it.dart';
import 'package:interview/features/auth/data/datasource/remote/auth_datasource.dart';
import 'package:interview/features/auth/data/respository/auth_repository.dart';
import 'package:interview/features/auth/presentation/bloc/auth_bloc.dart';

GetIt serviceLocator = GetIt.instance;

// ** This is a service locator, it is use to register the classes, data source, repositories etc
//  ** it helps us call and use whatever class we want to use from anywhere without us instantiating a new one
Future<void> setUpServiceLocator() async {
  //  Bloc
  serviceLocator.registerFactory<AuthBloc>(() => AuthBloc());

  // Data Source
  serviceLocator.registerFactory<AuthDataSource>(() => AuthDataSourceImpl());

   // Repositories
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepository());
}
