import 'package:shared_preferences/shared_preferences.dart';
class SessionRepository {
  SessionRepository(this.prefs);
  final SharedPreferences prefs;
  bool get signedIn => prefs.getBool('demo_signed_in') ?? false;
  Future<void> signIn(String email,String password) async {
    if(!email.contains('@') || password.isEmpty) throw StateError('Enter an email and password.');
    await prefs.setBool('demo_signed_in',true);
  }
  Future<void> signOut()=>prefs.setBool('demo_signed_in',false);
}
