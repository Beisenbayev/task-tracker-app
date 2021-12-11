import 'package:flutter/material.dart';
import 'package:to_do_app/app/archives/archives_page.dart';
import 'package:to_do_app/app/tasks/create_task_page.dart';
import 'package:to_do_app/app/tasks/edit_task_page.dart';
import 'package:to_do_app/app/tasks/tasks_page.dart';
import 'package:to_do_app/router/not_found_router_page.dart';

class RouteAliasData {
  static const String tasks = '/tasks';
  static const String createTask = '/tasks/create-task';
  static const String editTask = '/tasks/edit-task';
  static const String archives = '/archives';
}

class RoutesData {
  static final routes = {
    RouteAliasData.tasks: (context) => const TasksPage(),
    RouteAliasData.createTask: (context) => CreateTaskPage(),
    RouteAliasData.editTask: (context) => const EditTaskPage(),
    RouteAliasData.archives: (context) => const ArchivesPage(),
  };

  static const initialRoute = RouteAliasData.tasks;

  static unknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const NotFoundPage(),
    );
  }
}
