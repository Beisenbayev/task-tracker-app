import 'package:flutter/material.dart';
import 'package:to_do_app/app/home/widgets/categories_widget.dart';
import 'package:to_do_app/app/home/widgets/task_list_widget.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/models/home_page_model.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/widgets/tap_bar_widget.dart';
import 'package:to_do_app/router/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  void _changeTabIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  void _editCategory(int index) {
    Navigator.of(context).pushNamed(
      RouteAliasData.category,
      arguments: index,
    );
  }

  void _configureTask(int? index) {
    final _model = HomePageProvider.of(context)!.model;
    Navigator.of(context).pushNamed(
      RouteAliasData.task,
      arguments: TaskIndexData(
        categoryIndex: _model.categoryIndex,
        taskIndex: index,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _model = HomePageProvider.of(context)!.model;

    return Scaffold(
      backgroundColor: ColorThemeShelf.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingConsts.horizontal,
              ),
              child: TapBarWidget(
                currentIndex: _tabIndex,
                items: const <TapBarWidgetItem>[
                  TapBarWidgetItem(text: 'Task List'),
                  TapBarWidgetItem(text: 'Completed')
                ],
                onTap: _changeTabIndex,
              ),
            ),
            const SizedBox(height: 24),
            CategoriesWidget(
              categoris: _model.categories,
              selectedIndex: _model.categoryIndex,
              handleChangeCategory: _model.changeCategoryIndex,
              handleEditCategory: _editCategory,
            ),
            const SizedBox(height: 33),
            Expanded(
              child: TaskListWidget(
                tasks: _model.tasks,
                handelConfigureTask: _configureTask,
                isButtonAvailable: _model.isTasksAvailable,
              ),
            )
          ],
        ),
      ),
    );
  }
}
