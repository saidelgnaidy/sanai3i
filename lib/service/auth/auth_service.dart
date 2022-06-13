import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSrc {
  Future<User> logInWithPhone();
  Future<User> signUpWithPhone();
}
