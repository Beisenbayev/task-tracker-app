import 'package:flutter/cupertino.dart';
import 'package:to_do_app/core/storage/app_data_storage.dart';
import 'package:to_do_app/core/storage/avatar_image_storage.dart';
import 'package:to_do_app/router/routes.dart';

class ProfileModel extends ChangeNotifier {
  int avatarId = 0;
  String username = AvatarCollections.avatars[0].username;

  ProfileModel() {
    _setup();
  }

  void _setup() async {
    final localUsername = await LocalValueEditor.getUsername();
    final localAvatar = await LocalValueEditor.getProfileData();
    avatarId = localAvatar;
    if (localUsername == '') {
      _setUsername(localAvatar);
    } else {
      username = localUsername;
    }
    notifyListeners();
  }

  void _setUsername(int index) {
    username = AvatarCollections.avatars[index].username;
    notifyListeners();
  }

  void handleChangeUsername(String value) {
    username = value;
    if (username == '') _setUsername(avatarId);
    notifyListeners();
  }

  void handleChangeAvatar(int value) {
    if (username == AvatarCollections.avatars[avatarId].username) {
      _setUsername(value);
    }
    avatarId = value;
    notifyListeners();
  }

  void handleSaveProfile(BuildContext context) async {
    if (username == '') return;

    await LocalValueEditor.setUsername(username);
    await LocalValueEditor.setProfileData(avatarId);

    Navigator.of(context).pushReplacementNamed(RouteAliasData.home);
  }
}

class ProfileModelProvider extends InheritedNotifier {
  final ProfileModel model;

  const ProfileModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static ProfileModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileModelProvider>();
  }

  @override
  bool updateShouldNotify(ProfileModelProvider oldWidget) {
    return true;
  }
}
