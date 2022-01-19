import 'package:flutter/material.dart';
import 'package:to_do_app/app/profile/widgets/profile_prototype_widget.dart';
import 'package:to_do_app/app/profile/widgets/profile_settings_widget.dart';
import 'package:to_do_app/core/models/profile_model.dart';
import 'package:to_do_app/core/storage/avatar_image_storage.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/widgets/app_bar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = ProfileModelProvider.of(context)!.model;

    return Scaffold(
      backgroundColor: ColorThemeShelf.primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarWidget(
              type: AppBarWidgetType.main,
              title: 'Profile',
            ),
            ProfilePrototypeWidget(
              username: _model.username,
              image: AvatarCollections.avatars[_model.avatarId].image,
            ),
            const ProfileSettingsWidget(),
          ],
        ),
      ),
    );
  }
}
