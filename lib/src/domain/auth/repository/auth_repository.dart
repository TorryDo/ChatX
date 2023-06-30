import 'package:chatx/src/domain/auth/model/account.dart';

abstract class AuthRepository {

  Future<Account?> currentAccount();

  Future<Account?> login({required String userName, required String password});

  Future<void> logout();
}
