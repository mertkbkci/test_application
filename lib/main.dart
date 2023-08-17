// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/product/constant/project_items.dart';
import 'package:test_application/product/global/resource_context.dart';
import 'package:test_application/product/global/theme_notifier.dart';
import 'package:test_application/product/navigator/navigator_custom.dart';
import 'package:test_application/product/navigator/navigator_routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      debugShowCheckedModeBanner: false,

      theme: context.watch<ThemeNotifier>().currentTheme,

      // ThemeData.light(useMaterial3: true).copyWith(
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(
      //       circularTrackColor: Colors.black12,
      //proggres bar ortak rengi kullanmak için
      //       color: Colors.black),
      //   listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //   appBarTheme: const AppBarTheme(
      //app_bar_learn de her birine ayrı ayrı yapmaktansa burada planlanır hepsine uygulanır örnek olsun diye oradaki örnekleri silmiyorum yanında açıklamaları var ama normalde burada yazılması lazım orada kalabalık etmemesi lazım
      //    centerTitle: true,

      //     backgroundColor: Colors.transparent,
      //     systemOverlayStyle: SystemUiOverlayStyle.dark,
      //     elevation: 1,
      //   ),

      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   backgroundColor: ProjectColor.textColor,
      // ),
      // ), //birden çok app bar teması yapmak yerine kopyalar

      //initialRoute:'/' ,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text('Error'),
                ),
                body: Center(
                  child: Text('Route not found ${settings.name}'),
                ),
              )),
      routes: NavigatorRoutes().items,
      onGenerateRoute: NavigatorCustom().onGenerateRoute,
      // {
      //   "/": (context) => const LottieLearn(),
      //   "/home": (context) => const NavigateHomeView(),
      //   "/HomeDetail": (context) => const NavigateHomeDetailView(),
      // "/profile": (context) => const NavigateProfileView()
      // },
      //home: const LottieLearn(),
    );
  }
}
