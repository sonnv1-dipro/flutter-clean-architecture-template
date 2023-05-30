import 'package:clean_architecture_template/core/network/network_caller.dart';
import 'package:clean_architecture_template/core/network/refresh_token_caller.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/refresh_token_data_source.dart';
import 'package:clean_architecture_template/features/auth/domain/entites/refresh_token_entity.dart';
import 'package:clean_architecture_template/root/bloc_observer.dart';
import 'package:clean_architecture_template/root/setup.dart';
import 'package:clean_architecture_template/route.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_template/core/enums/flavors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> runMainApp(Flavor flavor) async {
  F.appFlavor = flavor;
  Bloc.observer = AppBlocObserver();
  await setupDependencies();
  RefreshTokenNetwork.instance.addRefreshTokenRepository(
    () async {
      // Example code
      final repo = RefreshTokenDataSourceImplement();
      return await repo.getRefreshToken(refreshToken: "");
    },
  );

  RefreshTokenNetwork.instance.addRefreshTokenListener(
    onError: (p1) {},
    onSuccess: (p1, p2) {
      // Restful.accessToken = null;
      // Restful.refreshToken = null;
    },
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('F.appFlavor: ${F.appFlavor}');
    return MaterialApp(
      title: F.title,
      routes: AppRoute.routes,
      initialRoute: AppRoute.initialRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
