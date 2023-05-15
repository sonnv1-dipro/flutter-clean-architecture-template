part of 'signin_bloc.dart';

class SigninEvent {
  const SigninEvent();
}

class SigninStarted extends SigninEvent {
  const SigninStarted();
}

class SigninSubmitted extends SigninEvent {
  final String email;
  final String password;

  const SigninSubmitted({
    required this.email,
    required this.password,
  });
}
