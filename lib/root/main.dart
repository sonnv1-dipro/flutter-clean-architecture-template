import 'package:clean_architecture_template/generated/codegen_loader.g.dart';
import 'package:clean_architecture_template/root/bloc_observer.dart';
import 'package:clean_architecture_template/root/setup.dart';
import 'package:clean_architecture_template/route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_template/core/enums/flavors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> runMainApp(Flavor flavor) async {
  F.appFlavor = flavor;
  Bloc.observer = AppBlocObserver();
  await setupDependencies();
  runApp(EasyLocalization(
    path: 'assets/locales',
    fallbackLocale: const Locale('en', 'US'),
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('vi', 'VI'),
    ],
    saveLocale: true,
    useOnlyLangCode: true,
    assetLoader: const CodegenLoader(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('F.appFlavor: ${F.appFlavor}');
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: F.title,
      routes: AppRoute.routes,
      initialRoute: AppRoute.initialRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
