import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/presentation/features/auth/bloc/signin/signin_bloc.dart';
import 'package:clean_architecture_template/presentation/features/auth/views/signup_page.dart';
import 'package:clean_architecture_template/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends BasePage {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listener: _onListener,
        child: const _SigninView(),
      ),
    );
  }

  void _onListener(BuildContext context, SigninState state) {}
}

class _SigninView extends BasePage {
  const _SigninView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.routeName<SignUpPage>());
          },
          child: const Text('Go to sign up'),
        ),
      ),
    );
  }
}
