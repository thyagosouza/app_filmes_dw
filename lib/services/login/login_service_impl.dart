import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/login_repository.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  //* Necessita da instancia do repository
  //? GetX vai ficar so na camada de pages e controllers
  final LoginRepository _loginRepository;
  //! melhor receber a instância no construtor
  LoginServiceImpl({required LoginRepository loginRepository})
      //* fazendo a atribuição ao loginRepository
      : _loginRepository = loginRepository;

  //** Explicação acima - Business Logic - Lógica de Negócios
  //  tudo isso foi feito para que o atributo continue privado
  // mas que seja acessadi fora dele como publico
  // */
  //* Repassan
  //do tudo para o REPOSITORY
  @override
  Future<UserCredential> login() => _loginRepository.login();

  @override
  Future<void> logout() => _loginRepository.logout();
}
