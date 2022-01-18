import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/storage/color_data_storage.dart';
import 'package:to_do_app/core/storage/icon_data_storage.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/category_item_widget.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'package:to_do_app/router/routes.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Category> categoris;
  final int selectedIndex;
  final void Function(int) handleChangeCategory;
  final void Function(int) handleEditCategory;

  const CategoriesWidget({
    Key? key,
    required this.categoris,
    required this.selectedIndex,
    required this.handleChangeCategory,
    required this.handleEditCategory,
  }) : super(key: key);

  void handleAddNewCategory(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.category);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingConsts.horizontal,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Categories',
                style: TextThemeShelf.title(18),
              ),
              ElevatedButton(
                onPressed: () => handleAddNewCategory(context),
                child: const Text('Add'),
                style: ButtonThemeShelf.primaryButton(5, 12),
              )
            ],
          ),
        ),
        const SizedBox(height: 26),
        Container(
          height: 140,
          padding: const EdgeInsets.only(left: PaddingConsts.horizontal),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoris.length,
            itemBuilder: (BuildContext context, int index) {
              final category = categoris[index];
              final colorData = ColorsCollection.colors[category.colorId];
              final icon = IconsCollection.icons[category.iconId];

              return GestureDetector(
                onTap: () => handleChangeCategory(index),
                onLongPress: () => handleEditCategory(index),
                child: CategoryItemWidget(
                  color: colorData.color,
                  activeColor: colorData.activeColor,
                  icon: icon,
                  title: category.title,
                  taskCount: 10,
                  isSelected: (index == selectedIndex),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
      ],
    );
  }
}
