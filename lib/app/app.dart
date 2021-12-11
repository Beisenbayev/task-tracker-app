import 'package:flutter/material.dart';
import 'package:to_do_app/router/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: RoutesData.routes,
      initialRoute: RoutesData.initialRoute,
      onGenerateRoute: (settings) => RoutesData.onGenerateRoute(settings),
      onUnknownRoute: (settings) => RoutesData.unknownRoute(settings),
    );
  }
}