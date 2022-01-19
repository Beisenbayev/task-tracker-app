import 'package:to_do_app/router/routes.dart';

class MenuLink {
  final String title;
  final String route;

  MenuLink({
    required this.title,
    required this.route,
  });
}

class MenuLinksCollection {
  static List<MenuLink> links = [
    MenuLink(title: 'Home', route: RouteAliasData.home),
    MenuLink(title: 'Profile', route: RouteAliasData.profile),
    MenuLink(title: 'Settings', route: RouteAliasData.settings),
    MenuLink(title: 'About', route: RouteAliasData.about),
  ];
}
