import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class ProfilePrototypeWidget extends StatelessWidget {
  final String username;
  final AssetImage image;

  const ProfilePrototypeWidget({
    Key? key,
    required this.username,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConsts.horizontal,
      ),
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: ColorThemeShelf.primaryBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProfileAvatarWidget(
                image: image,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _ProfileUsernameWidget(
                  username: username,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileAvatarWidget extends StatelessWidget {
  final AssetImage image;

  const _ProfileAvatarWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}

class _ProfileUsernameWidget extends StatelessWidget {
  final String username;

  const _ProfileUsernameWidget({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text('username:', style: TextThemeShelf.lightTitle(18)),
        const SizedBox(height: 5),
        Text(
          username,
          style: TextThemeShelf.title(34),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
