import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interview/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:interview/features/auth/data/model/user_model.dart';
import 'package:interview/features/auth/presentation/bloc/auth_bloc.dart';

abstract final class AuthDataSource {
  Future<User> signup(SignupEvent event);
  Future<User> login(LoginEvent event);
  Future<void> signout(LogoutEvent event);
  Future<void> googleSignin();
}

final class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userRf = FirebaseFirestore.instance.collection('users');
  @override
  Future<User> signup(SignupEvent event) async {
    final email = event.email;
    final firstName = event.firstName;
    final lastName = event.lastName;
    final password = event.password;
    final address = event.address;
    UserCredential result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModel userModel = UserModel(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      address: address,
    );
    await LocalDataStorage.instance.setUserModelInfo(userModel);
    await userRf.doc(result.user!.uid).set(userModel.toMap());
    final user = result.user!;
    return user;
  }

  // ** This function signin users, it takes in a email and password parameters
  @override
  Future<User> login(LoginEvent event) async {
    String email = event.email;
    String password = event.password;
    UserCredential result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = result.user!;
    return user;
  }

  @override
  Future<void> signout(LogoutEvent event) async {
    await LocalDataStorage.instance.clearStorage();
    await auth.signOut();
  }

  @override
  Future<void> googleSignin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // final userRf = firestore.collection('users');
    GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      final authAccount = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: authAccount.idToken,
        accessToken: authAccount.accessToken,
      );
      await auth.signInWithCredential(credential);
      userRf.doc(account.id).set({
        'email': account.email,
        'name': account.displayName,
        'profilepic': account.photoUrl,
      });
    }
  }
}
