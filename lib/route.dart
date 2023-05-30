import 'package:clean_architecture_template/features/auth/views/signin_page.dart';
import 'package:clean_architecture_template/features/auth/views/signup_page.dart';
import 'package:clean_architecture_template/features/post/domain/usercases/post_placeholder_example.dart';
import 'package:clean_architecture_template/features/post/views/blocs/list_post/list_post_bloc.dart';
import 'package:clean_architecture_template/features/post/views/blocs/post/post_bloc.dart';
import 'package:clean_architecture_template/features/post/views/list_post_page.dart';
import 'package:clean_architecture_template/features/post/views/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import 'features/post/data/datasources/post_remote_data_source.dart';
import 'features/post/data/repositories/post_repository_impl.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
    for (var e in [
      RoutePage<SignInPage>(
        page: (p0, params) => const SignInPage(),
      ).build(),
      RoutePage<SignUpPage>(
        page: (p0, params) => const SignUpPage(),
      ).build(),
      RoutePage<PostPage>(page: (p0, params) => const PostPage(), blocs: [
        /*
        * Insert blocs here
        */
        BlocProvider.value(
          value: PostBloc(
            usercase: PostPlaceholderExample(
              repository: PostRepositoryImpl(
                postRemoteDataSource: PostRemoteDataSourceImplement(),
              ),
            ),
          ),
        ),
      ]).build(),
      RoutePage<ListPostPage>(
        page: (p0, params) => const ListPostPage(),
        blocs: [
          BlocProvider.value(
            value: ListPostBloc(
              usercase: PostPlaceholderExample(
                repository: PostRepositoryImpl(
                  postRemoteDataSource: PostRemoteDataSourceImplement(),
                ),
              ),
            ),
          )
        ],
      ).build(),
    ])
      e.keys.first: e.values.first
  };

  static String initialRoute = AppRoute.routeName<SignInPage>();

  static String routeName<P>() => "/${P.toString()}";
}

class RoutePage<P extends Widget> {
  final Widget Function(BuildContext, dynamic params) page;
  List<SingleChildWidget>? blocs;

  RoutePage({required this.page, this.blocs});

  Widget _gen(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (blocs != null && blocs!.isNotEmpty) {
      return MultiBlocProvider(
        providers: blocs!,
        child: page.call(context, args),
      );
    } else {
      return page.call(context, args);
    }
  }

  Map<String, WidgetBuilder> build() => {"/${P.toString()}": (p0) => _gen(p0)};
}
