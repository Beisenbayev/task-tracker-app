import 'package:flutter/material.dart';
import 'package:to_do_app/app/category/category_page.dart';
import 'package:to_do_app/app/home/home_page.dart';
import 'package:to_do_app/app/task/task_page.dart';
import 'package:to_do_app/core/models/category_model.dart';
import 'package:to_do_app/core/models/home_page_model.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/router/not_found_page.dart';

class RouteAliasData {
  static const String home = 'home';
  static const String category = 'home/category';
  static const String task = 'home/task';
}

class RoutesData {
  static final Map<String, Widget Function(BuildContext)> routes = {};

  static const String initialRoute = RouteAliasData.home;

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteAliasData.home:
        return MaterialPageRoute(builder: (BuildContext context) {
          return HomePageProvider(
            model: HomePageModel(),
            child: const HomePage(),
          );
        });

      case RouteAliasData.category:
        int? categoryKey;
        if (settings.arguments != null) {
          categoryKey = settings.arguments as int;
        }
        return MaterialPageRoute(builder: (BuildContext context) {
          return CategoryModelProvider(
            model: CategoryModel(categoryKey),
            child: const CategoryPage(),
          );
        });

      case RouteAliasData.task:
        final taskIndexData = settings.arguments as TaskIndexData;

        return MaterialPageRoute(builder: (BuildContext context) {
          return TaskModelProvider(
            model: TaskModel(taskIndexData),
            child: const TaskPage(),
          );
        });

      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const NotFoundPage(),
        );
    }
  }

  static unknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const NotFoundPage(),
    );
  }
}
