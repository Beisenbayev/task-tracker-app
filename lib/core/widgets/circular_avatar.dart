import 'package:flutter/material.dart';
import 'package:to_do_app/core/storage/app_data_storage.dart';
import 'package:to_do_app/core/storage/avatar_image_storage.dart';
import 'package:to_do_app/router/routes.dart';

class CircularAvatarWidget extends StatefulWidget {
  final double diameter;
  final bool? withGesture;

  const CircularAvatarWidget({
    Key? key,
    required this.diameter,
    this.withGesture,
  }) : super(key: key);

  @override
  State<CircularAvatarWidget> createState() => _CircularAvatarWidgetState();
}

class _CircularAvatarWidgetState extends State<CircularAvatarWidget> {
  AssetImage _image = AvatarCollections.avatars[0].image;

  @override
  void initState() {
    super.initState();
    _getAvatarImage();
  }

  void _getAvatarImage() async {
    final localAvatar = await LocalValueEditor.getProfileData();
    setState(() {
      _image = AvatarCollections.avatars[localAvatar].image;
    });
  }

  void handleOnTap(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.profile);
  }

  @override
  Widget build(BuildContext context) {
    final child = (widget.withGesture != null)
        ? GestureDetector(
            onTap: () => handleOnTap(context),
          )
        : const SizedBox.shrink();

    return Container(
      width: widget.diameter,
      height: widget.diameter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _image,
          fit: BoxFit.cover,
        ),
        color: Colors.amber,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: child,
    );
  }
}
