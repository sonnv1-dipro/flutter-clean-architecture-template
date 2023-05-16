part of 'signin_bloc.dart';

class SignInState {
  final String? email;
  final String? password;
  final HandleStatus status;
  final String? error;

  const SignInState({
    required this.status,
    this.email,
    this.password,
    this.error,
  });
}

class SignInInitial extends SignInState {
  const SignInInitial()
      : super(
          status: HandleStatus.initial,
        );
}

class SignInWithEmailPasswprdLoading extends SignInState {
  SignInWithEmailPasswprdLoading({
    required String email,
    required String password,
  }) : super(
          status: HandleStatus.loading,
          email: email,
          password: password,
        );
}
