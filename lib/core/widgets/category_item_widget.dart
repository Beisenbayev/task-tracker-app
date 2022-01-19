import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  final Color color;
  final Color activeColor;
  final IconData icon;
  final String title;
  final int taskCount;
  final bool isSelected;
  final bool isRemoveMode;
  final void Function() removeCategory;

  const CategoryItemWidget({
    Key? key,
    required this.color,
    required this.activeColor,
    required this.icon,
    required this.title,
    required this.taskCount,
    required this.isSelected,
    required this.isRemoveMode,
    required this.removeCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow>? boxShadow = isSelected
        ? [
            BoxShadow(
              color: activeColor.withOpacity(0.4),
              blurRadius: 4,
              offset: const Offset(1, 4),
            )
          ]
        : null;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          width: 112,
          height: 136,
          padding: const EdgeInsets.fromLTRB(9, 11, 9, 18),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(63),
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            color: color,
            boxShadow: boxShadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CategoryItemIconWidget(color: activeColor, icon: icon),
              _CategoryItemInfoWidget(
                title: title,
                taskCount: taskCount,
                isSelected: isSelected,
              )
            ],
          ),
        ),
        isSelected
            ? _CategoryItemLineWidget(activeColor: activeColor)
            : const SizedBox.shrink(),
        isRemoveMode
            ? _CategoryRemoveButtonWidget(removeCategory: removeCategory)
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _CategoryItemIconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _CategoryItemIconWidget({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51,
      height: 51,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          icon,
          size: 24,
          color: color,
        ),
      ),
    );
  }
}

class _CategoryItemInfoWidget extends StatelessWidget {
  final String title;
  final int taskCount;
  final bool isSelected;

  const _CategoryItemInfoWidget({
    required this.title,
    required this.taskCount,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final countWidget = isSelected
        ? Text('$taskCount tasks', style: TextThemeShelf.subtitle(13))
        : const SizedBox(height: 5);

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextThemeShelf.title(16),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          countWidget,
        ],
      ),
    );
  }
}

class _CategoryItemLineWidget extends StatelessWidget {
  final Color activeColor;

  const _CategoryItemLineWidget({
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 4,
      child: Container(
        width: 72,
        height: 3,
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

class _CategoryRemoveButtonWidget extends StatelessWidget {
  final void Function() removeCategory;

  const _CategoryRemoveButtonWidget({
    Key? key,
    required this.removeCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: removeCategory,
        child: Container(
          decoration: BoxDecoration(
            color: ColorThemeShelf.dangerColor,
            border: Border.all(
              color: ColorThemeShelf.primaryDark,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: const Icon(
            Icons.remove_rounded,
            color: ColorThemeShelf.primaryLight,
            size: 18,
          ),
        ),
      ),
    );
  }
}
