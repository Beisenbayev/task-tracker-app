import 'package:flutter/material.dart';
import 'package:to_do_app/app/category/category_page.dart';
import 'package:to_do_app/app/home/home_page.dart';
import 'package:to_do_app/app/menu/menu_page.dart';
import 'package:to_do_app/app/profile/profile_page.dart';
import 'package:to_do_app/app/task/task_page.dart';
import 'package:to_do_app/app/welcome/welcome_page.dart';
import 'package:to_do_app/core/models/category_model.dart';
import 'package:to_do_app/core/models/profile_model.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/router/intro_screen_page.dart';
import 'package:to_do_app/router/not_found_page.dart';

class RouteAliasData {
  static const String intro = 'intro_screen';
  static const String welcome = 'welcome';
  static const String home = 'home';
  static const String category = 'home/category';
  static const String task = 'home/task';
  static const String profile = 'profile';
  static const String menu = 'menu';
  static const String settings = 'settings';
  static const String about = 'about';
}

class RoutesData {
  static final Map<String, Widget Function(BuildContext)> routes = {
    RouteAliasData.intro: (BuildContext context) => const IntroScreenPage(),
    RouteAliasData.welcome: (BuildContext context) => const WelcomePage(),
    RouteAliasData.home: (BuildContext context) => const HomePage(),
    RouteAliasData.menu: (BuildContext context) => const MenuPage(),
  };

  static const String initialRoute = RouteAliasData.intro;

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteAliasData.profile:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ProfileModelProvider(
            model: ProfileModel(),
            child: const ProfilePage(),
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
