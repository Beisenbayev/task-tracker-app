import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/models/profile_model.dart';
import 'package:to_do_app/core/storage/avatar_image_storage.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/tap_bar_widget.dart';

class ProfileSettingsWidget extends StatefulWidget {
  const ProfileSettingsWidget({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsWidget> createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  int _tabIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _model = ProfileModelProvider.of(context)!.model;
    final onPressed = _model.username.isEmpty
        ? null
        : () => _model.handleSaveProfile(context);
    final buttonStyle = _model.username.isEmpty
        ? ButtonThemeShelf.disabledButton(20, 34)
        : ButtonThemeShelf.primaryButton(20, 34);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 17,
        right: PaddingConsts.horizontal,
        bottom: 20,
        left: PaddingConsts.horizontal,
      ),
      decoration: const BoxDecoration(
        color: ColorThemeShelf.secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TapBarWidget(
            height: 55,
            currentIndex: _tabIndex,
            items: const <TapBarWidgetItem>[
              TapBarWidgetItem(text: 'Username'),
              TapBarWidgetItem(text: 'Avatar'),
            ],
            onTap: _changeIndex,
          ),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffcccccc)),
          const SizedBox(height: 25),
          SizedBox(
            height: 50,
            child: _ProfileSettingsBody(
              index: _tabIndex,
              username: _model.username,
              handleChangeUsername: _model.handleChangeUsername,
              avatarId: _model.avatarId,
              handleChangeAvatar: _model.handleChangeAvatar,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Save'),
            style: buttonStyle,
          )
        ],
      ),
    );
  }
}

class _ProfileSettingsBody extends StatelessWidget {
  late final List<Widget> widgets;
  final int index;
  final String username;
  final void Function(String) handleChangeUsername;
  final int avatarId;
  final void Function(int) handleChangeAvatar;

  _ProfileSettingsBody({
    required this.index,
    required this.username,
    required this.handleChangeUsername,
    required this.avatarId,
    required this.handleChangeAvatar,
  }) {
    widgets = [
      _ProfileSettingsUsername(
        username: username,
        handleChangeUsername: handleChangeUsername,
      ),
      _ProfileSettingsAvatar(
        avatarId: avatarId,
        handleChangeAvatar: handleChangeAvatar,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return widgets[index];
  }
}

class _ProfileSettingsUsername extends StatelessWidget {
  final String username;
  final void Function(String) handleChangeUsername;

  const _ProfileSettingsUsername({
    required this.username,
    required this.handleChangeUsername,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      initialValue: username,
      onChanged: (value) => handleChangeUsername(value),
      style: TextThemeShelf.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}

class _ProfileSettingsAvatar extends StatelessWidget {
  final int avatarId;
  final void Function(int) handleChangeAvatar;

  const _ProfileSettingsAvatar({
    required this.avatarId,
    required this.handleChangeAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: AvatarCollections.avatars.length,
      itemBuilder: (BuildContext context, int index) {
        final image = AvatarCollections.avatars[index].image;
        final Color borderColor = (index == avatarId)
            ? ColorThemeShelf.selectedForeground
            : Colors.white;

        return GestureDetector(
          onTap: () => handleChangeAvatar(index),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 15);
      },
    );
  }
}
