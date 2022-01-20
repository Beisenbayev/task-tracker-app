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
      image: const AssetImage('assets/avatars/bear.jpg'),
      username: 'Bear',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/wolf.jpg'),
      username: 'Wolf',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/eagle.jpg'),
      username: 'Eagle',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/macaque.jpg'),
      username: 'Macaque',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/monkey.jpg'),
      username: 'Monkey',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/bull.jpg'),
      username: 'Bull',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/panther.jpg'),
      username: 'Panther',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/penguin.jpg'),
      username: 'Penguin',
    ),
    ProfileAvatar(
      image: const AssetImage('assets/avatars/rhino.jpg'),
      username: 'Rhino',
    ),
  ];
}
