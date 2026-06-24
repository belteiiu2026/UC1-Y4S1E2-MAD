
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {

  static final AuthService instance = AuthService._init();
  AuthService._init();

  Future<User?> loadCurrentUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<bool> isExistLogin() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    return accessToken != null;
  }
}