import 'package:flutter/material.dart';
import 'package:to_do_app/app/menu/widget/menu_links_widget.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/storage/menu_link_storage.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/circular_avatar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeShelf.primaryDark,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 80,
            horizontal: PaddingConsts.horizontal,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _MenuPageAvatarWidget(),
              const SizedBox(height: 48),
              SizedBox(
                height: MenuLinksCollection.links.length * 62,
                child: MenuLinksWidget(links: MenuLinksCollection.links),
              ),
              const SizedBox(height: 32),
              _MenuPageCloseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuPageAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularAvatarWidget(diameter: 100),
        const SizedBox(height: 16),
        Text(
          'User#2345',
          style: TextThemeShelf.title(20, ColorThemeShelf.primaryLight),
        ),
      ],
    );
  }
}

class _MenuPageCloseWidget extends StatelessWidget {
  void handleOnTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOnTap(context),
      child: const Icon(
        Icons.close_rounded,
        size: 32,
        color: ColorThemeShelf.primaryLight,
      ),
    );
  }
}
