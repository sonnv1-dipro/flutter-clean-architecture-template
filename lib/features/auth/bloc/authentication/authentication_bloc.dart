import 'package:clean_architecture_template/core/enums/authentication_status.dart';
import 'package:clean_architecture_template/core/enums/handle_status.dart';
import 'package:clean_architecture_template/domain/entities/user/user.entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          const AuthenticationState.initial(),
        ) {
    on<AuthenticationStarted>(_init);
    on<AuthenticationLogin>(_login);
    on<AuthenticationLogout>(_logout);

    add(const AuthenticationStarted());
  }

  Future<void> _init(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emitter,
  ) async {
    try {
      emitter(
        const AuthenticationState.loading(),
      );
      await Future.delayed(const Duration(seconds: 2));
      // TODO
      // Handle authen status from local storage

      emitter(
        const AuthenticationState.unauthenticated(),
      );
    } catch (_) {
      emitter(
        const AuthenticationState.error(
            errorMessage: 'Error when init authentication'),
      );
    }
  }

  Future<void> _login(
    AuthenticationLogin event,
    Emitter<AuthenticationState> emitter,
  ) async {
    emitter(
      const AuthenticationState.loading(),
    );
    await Future.delayed(const Duration(seconds: 2));
    // TODO
    // Handle save to local storage

    emitter(
      AuthenticationState.authenticated(event.user),
    );
  }

  Future<void> _logout(
    AuthenticationLogout event,
    Emitter<AuthenticationState> emitter,
  ) async {
    emitter(
      const AuthenticationState.loading(),
    );
    await Future.delayed(const Duration(seconds: 2));
    // TODO
    // Handle remove from local storage

    emitter(
      const AuthenticationState.unauthenticated(),
    );
  }
}
