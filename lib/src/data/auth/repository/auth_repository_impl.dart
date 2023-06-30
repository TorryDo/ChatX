import 'dart:async';

import 'package:chatx/src/domain/auth/model/account.dart';
import 'package:chatx/src/domain/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final _fakeAccount = Account(
    id: '1233',
    userName: 'fake user',
    email: 'fake@gmail.com',
    dateTimeCreate: DateTime(2023, 6, 28),
  );

  Account? _account;

  @override
  Future<Account?> currentAccount() async {
    _account ??= _fakeAccount;
    return _fakeAccount;
  }

  @override
  Future<Account?> login({
    required String userName,
    required String password,
  }) async {
    return await Future.delayed(const Duration(milliseconds: 500), () {
      return _fakeAccount;
    });
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300), () {
    });
  }
}
