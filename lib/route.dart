import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/features/auth/views/signin_page.dart';
import 'package:clean_architecture_template/features/auth/views/signup_page.dart';
import 'package:clean_architecture_template/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_template/features/post/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_template/features/post/views/blocs/post/post_bloc.dart';
import 'package:clean_architecture_template/features/post/views/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
    for (var e in [
      RoutePage<SignInPage>(page: const SignInPage()).build(),
      RoutePage<SignUpPage>(page: const SignUpPage()).build(),
      RoutePage<PostPage>(page: const PostPage(), blocs: [
        // PostBloc(
        //   repository: PostRepositoryImpl(
        //     postRemoteDataSource: PostRemoteDataSourceImplement(),
        //   ),
        // ),
      ]).build(),
    ])
      e.keys.first: e.values.first
  };

  static String initialRoute = AppRoute.routeName<SignInPage>();

  static String routeName<P>() => "/${P.toString()}";
}

class RoutePage<P> {
  final BasePage page;
  final List<Bloc>? blocs;

  RoutePage({required this.page, this.blocs});

  Widget _gen(BuildContext context) {
    if (blocs != null && blocs!.isNotEmpty) {
      return MultiBlocProvider(
        providers: blocs!.map((e) => BlocProvider.value(value: e)).toList(),
        child: page,
      );
    } else {
      return page;
    }
  }

  Map<String, WidgetBuilder> build() => {
        "/${P.toString()}": (p0) => _gen(p0),
      };
}
