import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserCredential> login() async {
    //* googleUser -> chama a janela para  a escolha do gmail
    final googleUser = await GoogleSignIn().signIn();
    //* googleAuth -> pegar os dados de autenticação vindos do googleUser
    //! se ele não for nulo
    final googleAuth = await googleUser?.authentication;

    //* verificação pra saber se googleAuth é valida
    if (googleAuth != null) {
      //* se não for nulo, aturiza o Firebase a cadastrar o usuario(Credetial)
      final credential = GoogleAuthProvider.credential(
        //* passar o Token de Acesso e o ID desse usuário cadastrado
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //? Tendo a credential, retorna fazendo o login no Firebase
      return FirebaseAuth.instance.signInWithCredential(credential);
    }
    throw Exception('Erro ao realizar login com Google');
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
