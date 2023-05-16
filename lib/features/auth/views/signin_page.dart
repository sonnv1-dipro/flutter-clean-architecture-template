import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/features/auth/bloc/signin/signin_bloc.dart';
import 'package:clean_architecture_template/features/post/views/post_page.dart';
import 'package:clean_architecture_template/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends BasePage {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: BlocListener<SignInBloc, SignInState>(
        listener: _onListener,
        child: const _SignInView(),
      ),
    );
  }

  void _onListener(BuildContext context, SignInState state) {}
}

class _SignInView extends BasePage {
  const _SignInView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.routeName<PostPage>());
          },
          child: const Text('Go to sign up'),
        ),
      ),
    );
  }
}
