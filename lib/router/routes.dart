import 'package:flutter/material.dart';
import 'package:to_do_app/app/tasks/create_task_page.dart';
import 'package:to_do_app/app/tasks/edit_task_page.dart';
import 'package:to_do_app/app/tasks/tasks_page.dart';
import 'package:to_do_app/router/not_found_router_page.dart';

class RoutesData {
  static final routes = {
    '/tasks': (context) => const TasksPage(),
    '/tasks/form': (context) => CreateTaskPage(),
    '/tasks/edit-task': (context) =>
        EditTaskPage(index: ModalRoute.of(context)!.settings.arguments as int),
  };

  static const initialRoute = '/tasks';

  static unknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const NotFoundPage(),
    );
  }
}
