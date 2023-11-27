import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStorage {
  static final LocalDataStorage instance = LocalDataStorage._init();
  static SharedPreferences? _prefs;
  LocalDataStorage._init();

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  final String _address = 'Address';
  final String _password = 'Password';
  final String _firstName = 'FirstName';
  final String _lastName = 'LastName';
  final String _name = 'Username';
  final String _email = 'Email';
  final String _photoUrl = 'PhotoUrl';

  Future<void> setUserInfo(User user) async {
    final pref = await instance.prefs;
    await pref.setString(_name, user.displayName ?? '');
    await pref.setString(_email, user.email ?? '');
    await pref.setString(_photoUrl, user.photoURL ?? '');
  }

  Future<void> setUserModelInfo(UserModel user) async {
    final pref = await instance.prefs;
    await pref.setString(_firstName, user.firstName);
    await pref.setString(_lastName, user.lastName);
    await pref.setString(_email, user.email);
    await pref.setString(_photoUrl, user.address);
  }

  Future<void> setAddress(String address) async {
    final pref = await instance.prefs;
    await pref.setString(_address, address);
  }

  Future<void> setPassword(String password) async {
    final pref = await instance.prefs;
    await pref.setString(_password, password);
  }

  Future<bool> clearStorage() async {
    final pref = await instance.prefs;
    await pref.clear();

    return true;
  }
}
