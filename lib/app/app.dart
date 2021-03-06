import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/router/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'ToDo',
      routes: RoutesData.routes,
      initialRoute: RoutesData.initialRoute,
      onGenerateRoute: (settings) => RoutesData.onGenerateRoute(settings),
      onUnknownRoute: (settings) => RoutesData.unknownRoute(settings),
    );
  }
}
