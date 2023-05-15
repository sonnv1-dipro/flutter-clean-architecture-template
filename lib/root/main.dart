import 'package:clean_architecture_template/root/bloc_observer.dart';
import 'package:clean_architecture_template/root/setup.dart';
import 'package:clean_architecture_template/route.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_template/data/enums/flavors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> runMainApp(Flavor flavor) async {
  F.appFlavor = flavor;
  Bloc.observer = GlobalBloc();
  await setupDependencies();
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
