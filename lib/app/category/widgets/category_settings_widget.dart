import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/models/category_model.dart';
import 'package:to_do_app/core/storage/color_data_storage.dart';
import 'package:to_do_app/core/storage/icon_data_storage.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/tap_bar_widget.dart';

class CategorySettingsWidget extends StatefulWidget {
  const CategorySettingsWidget({Key? key}) : super(key: key);

  @override
  State<CategorySettingsWidget> createState() => _CategorySettingsWidgetState();
}

class _CategorySettingsWidgetState extends State<CategorySettingsWidget> {
  int _tabIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _model = CategoryModelProvider.of(context)!.model;
    final onPressed =
        _model.title.isEmpty ? null : () => _model.saveNewCategory(context);
    final buttonStyle = _model.title.isEmpty
        ? ButtonThemeShelf.disabledButton(20, 34)
        : ButtonThemeShelf.primaryButton(20, 34);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 17,
        right: PaddingConsts.horizontal,
        bottom: 20,
        left: PaddingConsts.horizontal,
      ),
      decoration: const BoxDecoration(
        color: ColorThemeShelf.secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TapBarWidget(
            height: 55,
            currentIndex: _tabIndex,
            items: const <TapBarWidgetItem>[
              TapBarWidgetItem(text: 'Title'),
              TapBarWidgetItem(text: 'Color'),
              TapBarWidgetItem(text: 'Icon')
            ],
            onTap: _changeIndex,
          ),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffcccccc)),
          const SizedBox(height: 25),
          SizedBox(
            height: 50,
            child: _CategorySettingsBody(
              index: _tabIndex,
              title: _model.title,
              handleChangeTitle: _model.handleChangeTitle,
              colorId: _model.colorId,
              handleChangeColor: _model.handleChangeColor,
              iconId: _model.iconId,
              handleChangeIcon: _model.handleChangeIcon,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Save Category'),
            style: buttonStyle,
          )
        ],
      ),
    );
  }
}

class _CategorySettingsBody extends StatelessWidget {
  final int index;
  final String title;
  final void Function(String) handleChangeTitle;
  final int colorId;
  final void Function(int) handleChangeColor;
  final int iconId;
  final void Function(int) handleChangeIcon;
  late final List<Widget> widgets;

  _CategorySettingsBody({
    required this.index,
    required this.title,
    required this.handleChangeTitle,
    required this.colorId,
    required this.handleChangeColor,
    required this.iconId,
    required this.handleChangeIcon,
  }) {
    widgets = [
      _CategorySettingsTitle(
        title: title,
        handleChangeTitle: handleChangeTitle,
      ),
      _CategorySettingsColor(
        colorId: colorId,
        handleChangeColor: handleChangeColor,
      ),
      _CategorySettingsIcon(
        colorId: colorId,
        iconId: iconId,
        handleChangeIcon: handleChangeIcon,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return widgets[index];
  }
}

class _CategorySettingsTitle extends StatelessWidget {
  final String title;
  final void Function(String) handleChangeTitle;

  const _CategorySettingsTitle({
    required this.title,
    required this.handleChangeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      onChanged: (value) => handleChangeTitle(value),
      style: TextThemeShelf.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}

class _CategorySettingsColor extends StatelessWidget {
  final int colorId;
  final void Function(int) handleChangeColor;

  const _CategorySettingsColor({
    required this.colorId,
    required this.handleChangeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: ColorsCollection.colors.length,
      itemBuilder: (BuildContext context, int index) {
        final Color borderColor = (index == colorId)
            ? ColorsCollection.colors[index].activeColor
            : Colors.white;

        return GestureDetector(
          onTap: () => handleChangeColor(index),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: ColorsCollection.colors[index].color,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 15);
      },
    );
  }
}

class _CategorySettingsIcon extends StatelessWidget {
  final int colorId;
  final int iconId;
  final void Function(int) handleChangeIcon;

  const _CategorySettingsIcon({
    required this.colorId,
    required this.iconId,
    required this.handleChangeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: IconsCollection.icons.length,
      itemBuilder: (BuildContext context, int index) {
        final color = (iconId == index)
            ? ColorsCollection.colors[colorId].activeColor
            : Colors.grey;

        return GestureDetector(
          onTap: () => handleChangeIcon(index),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                color: color,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                IconsCollection.icons[index],
                size: 28,
                color: color,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 15);
      },
    );
  }
}
