import 'package:flutter/material.dart';

class ProfileAvatar {
  final AssetImage image;
  final String username;

  ProfileAvatar({
    required this.image,
    required this.username,
  });
}

class AvatarCollections {
  static List<ProfileAvatar> avatars = [
    ProfileAvatar(
      image: const AssetImage('./avatars/bear.jpg'),
      username: 'Bear',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/wolf.jpg'),
      username: 'Wolf',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/eagle.jpg'),
      username: 'Eagle',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/macaque.jpg'),
      username: 'Macaque',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/monkey.jpg'),
      username: 'Monkey',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/bull.jpg'),
      username: 'Bull',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/panther.jpg'),
      username: 'Panther',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/penguin.jpg'),
      username: 'Penguin',
    ),
    ProfileAvatar(
      image: const AssetImage('./avatars/rhino.jpg'),
      username: 'Rhino',
    ),
  ];
}
