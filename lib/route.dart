import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/features/auth/views/signin_page.dart';
import 'package:clean_architecture_template/features/auth/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
    for (var e in [
      RoutePage<SignInPage>(page: (ctx) => const SignInPage()).build(),
      RoutePage<SignUpPage>(page: (ctx) => const SignUpPage()).build(),
    ])
      e.keys.first: e.values.first
  };

  static String initialRoute = AppRoute.routeName<SignInPage>();

  static String routeName<P>() => "/${P.toString()}";
}

class RoutePage<P> {
  final BasePage Function(BuildContext ctx) page;
  final List<Bloc>? blocs;

  RoutePage({required this.page, this.blocs});

  Widget _gen(BuildContext context) {
    if (blocs != null) {
      return MultiBlocProvider(
        providers:
            blocs!.map((e) => BlocProvider(create: (context) => e)).toList(),
        child: page.call(context),
      );
    } else {
      return page.call(context);
    }
  }

  Map<String, WidgetBuilder> build() => {
        "/${P.toString()}": (p0) => _gen(p0),
      };
}
