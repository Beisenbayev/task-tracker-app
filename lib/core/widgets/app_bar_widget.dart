import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/circular_avatar.dart';
import 'package:to_do_app/router/routes.dart';

enum AppBarWidgetType { main, back }

class AppBarWidget extends StatelessWidget {
  final AppBarWidgetType type;
  final String title;

  const AppBarWidget({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: PaddingConsts.horizontal,
      ),
      decoration: const BoxDecoration(
        color: ColorThemeShelf.primaryBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _AppBarWidgetIcon(type: type),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextThemeShelf.title(20),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          const CircularAvatarWidget(
            diameter: 40,
          ),
        ],
      ),
    );
  }
}

class _AppBarWidgetIcon extends StatelessWidget {
  final AppBarWidgetType type;

  const _AppBarWidgetIcon({
    required this.type,
  });

  void handleGoBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void handleOpenSidebar(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.menu);
  }

  @override
  Widget build(BuildContext context) {
    final IconData icon = type == AppBarWidgetType.back
        ? Icons.keyboard_backspace_rounded
        : Icons.menu_rounded;

    final onTap = type == AppBarWidgetType.back
        ? () => handleGoBack(context)
        : () => handleOpenSidebar(context);

    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 30,
        color: ColorThemeShelf.primaryGrey,
      ),
    );
  }
}
