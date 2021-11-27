import 'package:flutter/material.dart';
import 'package:to_do_app/app/groups/groups_page.dart';
import 'package:to_do_app/app/groups/group_form_page.dart';
import 'package:to_do_app/router/not_found_router_page.dart';

class RoutesData {
  static final routes = {
    '/groups': (context) => GroupsPage(),
    '/groups/form': (context) => GroupFormPage(),
  };

  static const initialRoute = '/groups';

  static unknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const NotFoundPage(),
    );
  }
}
