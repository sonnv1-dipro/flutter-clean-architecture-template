import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/features/auth/views/signup_page.dart';
import 'package:clean_architecture_template/route.dart';
import 'package:flutter/material.dart';

class SignInPage extends BasePage {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("Got to SignUp"),
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.routeName<SignUpPage>());
          },
        ),
      ),
    );
  }
}
