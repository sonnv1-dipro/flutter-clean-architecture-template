part of 'signin_bloc.dart';

class SignInEvent {
  const SignInEvent();
}

class SignInStarted extends SignInEvent {
  const SignInStarted();
}

class SignInSubmitted extends SignInEvent {
  final String email;
  final String password;

  const SignInSubmitted({
    required this.email,
    required this.password,
  });
}
