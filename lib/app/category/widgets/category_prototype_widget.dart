import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class CategoryPrototypeWidget extends StatelessWidget {
  final Color color;
  final Color activeColor;
  final IconData icon;
  final String title;

  const CategoryPrototypeWidget({
    Key? key,
    required this.color,
    required this.activeColor,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          width: 230,
          height: 280,
          padding: const EdgeInsets.fromLTRB(18, 24, 18, 38),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(46),
              topRight: Radius.circular(126),
              bottomLeft: Radius.circular(46),
              bottomRight: Radius.circular(46),
            ),
            color: color,
            boxShadow: [
              BoxShadow(
                color: activeColor.withOpacity(0.4),
                blurRadius: 4,
                offset: const Offset(1, 4),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CategoryPrototypeIcon(color: activeColor, icon: icon),
              _CategoryPrototypeInfo(title: title)
            ],
          ),
        ),
        _CategoryPrototypeLine(activeColor: activeColor)
      ],
    );
  }
}

class _CategoryPrototypeIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _CategoryPrototypeIcon({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          icon,
          size: 50,
          color: color,
        ),
      ),
    );
  }
}

class _CategoryPrototypeInfo extends StatelessWidget {
  final String title;

  const _CategoryPrototypeInfo({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextThemeShelf.title(32),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            '+0 task',
            style: TextThemeShelf.subtitle(26),
          ),
        ],
      ),
    );
  }
}

class _CategoryPrototypeLine extends StatelessWidget {
  final Color activeColor;

  const _CategoryPrototypeLine({
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 45,
      bottom: 0,
      child: Container(
        width: 140,
        height: 6,
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
