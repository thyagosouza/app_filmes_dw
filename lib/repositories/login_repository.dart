import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<UserCredential> login();

  Future<void> logout(); //? é só um contrato
}
