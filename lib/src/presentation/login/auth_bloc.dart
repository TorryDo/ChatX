import 'package:chatx/src/domain/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(const AuthState()) {
    on<AuthUsernameChanged>((ev, emit) => emit(_onUsernameChanged(ev)));
    on<AuthPasswordChanged>((ev, emit) => emit(_onPasswordChanged(ev)));
    on<LoginSubmitted>((ev, emit) => _onLoginSubmitted(ev, emit));
  }

  final AuthRepository _authRepository;

  AuthState _onUsernameChanged(AuthUsernameChanged event) {
    return state.copyWith(username: event.username);
  }

  AuthState _onPasswordChanged(AuthPasswordChanged event) {
    return state.copyWith(password: event.password);
  }

  _onLoginSubmitted(LoginSubmitted event, emitter) async {
    var username = event.username;
    var password = event.password;

    if (username.isEmpty || password.isEmpty) {
      emitter(
        const ErrorState(errorMsg: 'username and password must not empty'),
      );
    }

    var account = await _authRepository.login(
      userName: username,
      password: password,
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (account != null) {
        emitter(SuccessState());
      } else {
        emitter(const ErrorState(errorMsg: 'account not found'));
      }
    });
  }
}
