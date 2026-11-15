import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSession extends ChangeNotifier {
  AuthSession(this._preferences);

  final SharedPreferences _preferences;

  static const _sessionKey = 'refreshi_demo_session';

  bool get isAuthenticated => _preferences.getBool(_sessionKey) ?? false;

  Future<void> signIn() async {
    await _preferences.setBool(_sessionKey, true);
    notifyListeners();
  }

  Future<void> signOut() async {
    await _preferences.setBool(_sessionKey, false);
    notifyListeners();
  }
}
