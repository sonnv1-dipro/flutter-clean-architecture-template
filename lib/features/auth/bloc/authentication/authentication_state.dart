part of 'authentication_bloc.dart';

class AuthenticationState {
  final AuthenticationStatus status;
  final UserEntity? user;
  final HandleStatus loadingStatus;
  final String? error;

  const AuthenticationState({
    required this.status,
    this.user,
    required this.loadingStatus,
    this.error,
  });

  const AuthenticationState.initial()
      : this(
          status: AuthenticationStatus.initial,
          loadingStatus: HandleStatus.initial,
        );

  const AuthenticationState.error({
    required String errorMessage,
  }) : this(
          status: AuthenticationStatus.unknown,
          loadingStatus: HandleStatus.error,
          error: errorMessage,
        );

  const AuthenticationState.loading()
      : this(
          status: AuthenticationStatus.unknown,
          loadingStatus: HandleStatus.loading,
        );

  const AuthenticationState.authenticated(UserEntity user)
      : this(
          status: AuthenticationStatus.authenticated,
          user: user,
          loadingStatus: HandleStatus.success,
        );

  const AuthenticationState.unauthenticated()
      : this(
          status: AuthenticationStatus.unauthenticated,
          loadingStatus: HandleStatus.success,
        );
}
