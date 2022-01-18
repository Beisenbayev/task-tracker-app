import 'package:flutter/material.dart';
import 'package:to_do_app/router/routes.dart';

class CircularAvatarWidget extends StatelessWidget {
  const CircularAvatarWidget({Key? key}) : super(key: key);

  void handleOnTap(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.profile);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOnTap(context),
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
    );
  }
}
