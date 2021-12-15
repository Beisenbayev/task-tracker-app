import 'package:flutter/material.dart';
import 'package:to_do_app/app/tasks/modules/colors_data.dart';

class ColorPickerWidget extends StatefulWidget {
  final void Function(Color color) changeSelectedColor;

  const ColorPickerWidget({
    Key? key,
    required this.changeSelectedColor,
  }) : super(key: key);

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  int selectedColorId = 1;

  void handleChangeSelectedColorId(int id, Color color) {
    setState(() => selectedColorId = id);
    widget.changeSelectedColor(color);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ColorsCollection.colors.map((item) {
        return _ColorPaletteWidget(
          id: item.id,
          color: item.color,
          selected: selectedColorId == item.id,
          handleSelect: handleChangeSelectedColorId,
        );
      }).toList(),
    );
  }
}

class _ColorPaletteWidget extends StatelessWidget {
  final int id;
  final Color color;
  final bool selected;
  final void Function(int, Color) handleSelect;

  const _ColorPaletteWidget({
    Key? key,
    required this.id,
    required this.color,
    required this.selected,
    required this.handleSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoxBorder border = selected
        ? Border.all(width: 4.0, color: Colors.green)
        : Border.all(width: 1.0, color: Colors.black);

    return GestureDetector(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: border,
          color: color,
        ),
      ),
      onTap: () => handleSelect(id, color),
    );
  }
}
