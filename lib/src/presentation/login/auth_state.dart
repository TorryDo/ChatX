part of 'auth_bloc.dart';

class AuthState {
  final String username;
  final String password;

  const AuthState({
    this.username = "",
    this.password = "",
  });

  AuthState copyWith({
    String? username,
    String? password,
  }) {
    return AuthState(
        username: username ?? this.username,
        password: password ?? this.password);
  }
}

class LoadingState extends AuthState {}

class SuccessState extends AuthState {}

class ErrorState extends AuthState {
  const ErrorState({
    this.errorMsg,
    this.userNameErrorMsg,
    this.passwordErrorMsg,
    this.retypePasswordErrorMsg,
  });

  /// show common error message, eg: no network connection, etc
  final String? errorMsg;

  /// not null if username not match specific pattern
  final String? userNameErrorMsg;

  /// not null if password is incorrect, etc
  final String? passwordErrorMsg;

  /// not null if retype password is not the same as password
  final String? retypePasswordErrorMsg;
}
