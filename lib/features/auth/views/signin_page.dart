import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/features/auth/bloc/signin/signin_bloc.dart';
import 'package:clean_architecture_template/features/post/views/post_page.dart';
import 'package:clean_architecture_template/generated/locale_keys.g.dart';
import 'package:clean_architecture_template/route.dart';
import 'package:easy_localization/easy_localization.dart';
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
            child: Text(
              LocaleKeys.hello_world.tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('context.locale: ${context.locale}');
            if (context.locale == const Locale('vi', 'VI')) {
              context.setLocale(const Locale('en', 'US'));
              return;
            }
            context.setLocale(const Locale('vi', 'VI'));
          },
          child: const Icon(Icons.add),
        ));
  }
}
