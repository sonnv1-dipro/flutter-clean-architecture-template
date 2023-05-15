import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/presentation/features/auth/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends BasePage {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: _onListener,
        child: const _SignUpView(),
      ),
    );
  }

  void _onListener(BuildContext context, SignupState state) {}
}

class _SignUpView extends BasePage {
  const _SignUpView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: const Center(
        child: Text('Sign Up Page'),
      ),
    );
  }
}
