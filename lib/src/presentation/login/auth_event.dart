part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthUsernameChanged extends AuthEvent {
  final String username;

  const AuthUsernameChanged(this.username);
}

class AuthPasswordChanged extends AuthEvent {
  final String password;

  const AuthPasswordChanged(this.password);
}

class LoginSubmitted extends AuthEvent {
  final String username;
  final String password;
  const LoginSubmitted(this.username, this.password);
}

class SignupSubmitted extends AuthEvent {
  const SignupSubmitted();
}
