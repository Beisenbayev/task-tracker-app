import 'package:flutter/material.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class CategoryModel extends ChangeNotifier {
  final int? _categoryIndex;
  final _categoriesBox = HiveBoxes.getCategoriesBox();
  String title = 'Title';
  int colorId = 2;
  int iconId = 3;

  CategoryModel(this._categoryIndex) {
    if (_categoryIndex != null) {
      final category = _categoriesBox.getAt(_categoryIndex!);
      title = category!.title;
      colorId = category.colorId;
      iconId = category.iconId;
    }
  }

  void handleChangeTitle(String value) {
    title = value;
    notifyListeners();
  }

  void handleChangeColor(int value) {
    colorId = value;
    notifyListeners();
  }

  void handleChangeIcon(int value) {
    iconId = value;
    notifyListeners();
  }

  void saveNewCategory(BuildContext context) {
    if (title.isEmpty) return;

    final category = Category(
      title: title,
      colorId: colorId,
      iconId: iconId,
    );

    if (_categoryIndex != null) {
      _categoriesBox.putAt(_categoryIndex!, category);
    } else {
      _categoriesBox.add(category);
    }

    Navigator.of(context).pop();
  }
}

class CategoryModelProvider extends InheritedNotifier {
  final CategoryModel model;

  const CategoryModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static CategoryModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CategoryModelProvider>();
  }

  @override
  bool updateShouldNotify(CategoryModelProvider oldWidget) {
    return true;
  }
}
