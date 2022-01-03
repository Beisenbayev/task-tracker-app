import 'package:flutter/material.dart';
import 'package:to_do_app/app/archives/archives_page.dart';
import 'package:to_do_app/app/category/category_page.dart';
import 'package:to_do_app/app/home/home_page.dart';
import 'package:to_do_app/app/tasks/create_task_page.dart';
import 'package:to_do_app/app/tasks/edit_task_page.dart';
import 'package:to_do_app/app/tasks/tasks_page.dart';
import 'package:to_do_app/router/not_found_page.dart';

class RouteAliasData {
  static const String home = 'home';
  static const String createCategory = 'home/create-category';
  //
  static const String tasks = 'tasks';
  static const String createTask = 'tasks/create-task';
  static const String editTask = 'tasks/edit-task';
  static const String archives = 'archives';
}

class RoutesData {
  static final Map<String, Widget Function(BuildContext)> routes = {
    RouteAliasData.home: (context) => const HomePage(),
    RouteAliasData.createCategory: (context) => const CreateCategoryPage(),
    //
    RouteAliasData.tasks: (context) => const TasksPage(),
    RouteAliasData.createTask: (context) => CreateTaskPage(),
    RouteAliasData.archives: (context) => const ArchivesPage(),
  };

  static const String initialRoute = RouteAliasData.home;

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteAliasData.editTask:
        final taskKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (BuildContext context) => EditTaskPage(taskKey: taskKey),
        );
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
