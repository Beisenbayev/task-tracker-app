import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class HomePageModel extends ChangeNotifier {
  final _categoriesBox = HiveBoxes.getCategoriesBox();
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  HomePageModel() {
    _setup();
  }

  void _setup() {
    _notifyListenChange();
    _categoriesBox.listenable().addListener(_notifyListenChange);
  }

  _notifyListenChange() {
    _categories = _categoriesBox.values.toList();
    notifyListeners();
  }
}

class HomePageProvider extends InheritedNotifier {
  final HomePageModel model;

  const HomePageProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static HomePageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomePageProvider>();
  }

  @override
  bool updateShouldNotify(HomePageProvider oldWidget) {
    return true;
  }
}
