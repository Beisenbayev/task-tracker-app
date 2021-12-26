import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class TapBarWidget extends StatelessWidget {
  final List<TapBarWidgetItem> items;
  final int currentIndex;
  final void Function(int) onTap;

  const TapBarWidget({
    Key? key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConsts.horizontal,
      ),
      child: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: const Color(0xff242424),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items.mapIndexed<_TapBarWidgetItem>((index, value) {
            return _TapBarWidgetItem(
              index: index,
              text: value.text,
              isSelected: index == currentIndex,
              onTap: onTap,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _TapBarWidgetItem extends StatelessWidget {
  final int index;
  final String text;
  final bool isSelected;
  final void Function(int) onTap;

  const _TapBarWidgetItem({
    Key? key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isSelected ? ColorsTheme.primaryLight : ColorsTheme.primaryDark;
    final textColor =
        isSelected ? ColorsTheme.primaryDark : ColorsTheme.primaryLight;

    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.2),
        ),
      ),
      onTap: () => onTap(index),
    );
  }
}

class TapBarWidgetItem {
  final String text;

  const TapBarWidgetItem({
    required this.text,
  });
}
