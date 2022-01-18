import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/category_model.dart';
import 'package:to_do_app/app/category/widgets/category_prototype_widget.dart';
import 'package:to_do_app/app/category/widgets/category_settings_widget.dart';
import 'package:to_do_app/core/storage/color_data_storage.dart';
import 'package:to_do_app/core/storage/icon_data_storage.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/widgets/app_bar_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = CategoryModelProvider.of(context)!.model;
    final colorData = ColorsCollection.colors[_model.colorId];
    final icon = IconsCollection.icons[_model.iconId];

    return Scaffold(
      backgroundColor: ColorThemeShelf.primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarWidget(
              type: AppBarWidgetType.back,
              title: 'Edit Category',
            ),
            CategoryPrototypeWidget(
              color: colorData.color,
              activeColor: colorData.activeColor,
              icon: icon,
              title: _model.title,
            ),
            const CategorySettingsWidget(),
          ],
        ),
      ),
    );
  }
}
