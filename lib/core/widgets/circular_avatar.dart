import 'package:flutter/material.dart';
import 'package:to_do_app/router/routes.dart';

class CircularAvatarWidget extends StatelessWidget {
  final double diameter;

  const CircularAvatarWidget({
    Key? key,
    required this.diameter,
  }) : super(key: key);

  void handleOnTap(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.profile);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOnTap(context),
      child: Container(
        width: diameter,
        height: diameter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./avatars/bear.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.amber,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
    );
  }
}
