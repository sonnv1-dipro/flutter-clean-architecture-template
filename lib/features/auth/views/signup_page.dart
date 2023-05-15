import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends BasePage {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
    );
  }
}
