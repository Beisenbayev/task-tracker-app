import 'package:flutter/material.dart';
import 'package:to_do_app/core/storage/menu_link_storage.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class MenuLinksWidget extends StatelessWidget {
  final List<MenuLink> links;

  const MenuLinksWidget({
    Key? key,
    required this.links,
  }) : super(key: key);

  void handleOnTap(BuildContext context, String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final link = links[index];

        return GestureDetector(
          onTap: () => handleOnTap(context, link.route),
          child: SizedBox(
            height: 62,
            child: Text(
              link.title,
              style: TextThemeShelf.title(44, ColorThemeShelf.primaryLight),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10);
      },
      itemCount: links.length,
    );
  }
}
