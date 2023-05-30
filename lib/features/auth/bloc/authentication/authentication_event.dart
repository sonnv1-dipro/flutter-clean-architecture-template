part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationStarted extends AuthenticationEvent {
  const AuthenticationStarted();
}

class AuthenticationLogout extends AuthenticationEvent {}

class AuthenticationLogin extends AuthenticationEvent {
  final UserEntity user;

  const AuthenticationLogin({
    required this.user,
  });
}
