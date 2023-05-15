part of 'signin_bloc.dart';

class SigninState {
  final String? email;
  final String? password;
  final HandleStatus status;
  final String? error;

  const SigninState({
    required this.status,
    this.email,
    this.password,
    this.error,
  });
}

class SigninInitial extends SigninState {
  const SigninInitial()
      : super(
          status: HandleStatus.initial,
        );
}

class SigninWithEmailPasswprdLoading extends SigninState {
  SigninWithEmailPasswprdLoading({
    required String email,
    required String password,
  }) : super(
          status: HandleStatus.loading,
          email: email,
          password: password,
        );
}
