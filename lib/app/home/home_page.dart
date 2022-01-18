import 'package:flutter/material.dart';
import 'package:to_do_app/app/home/widgets/archive_list_widget.dart';
import 'package:to_do_app/app/home/widgets/categories_widget.dart';
import 'package:to_do_app/app/home/widgets/task_list_widget.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/models/archive_model.dart';
import 'package:to_do_app/core/models/home_page_model.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/storage/global_key_storage.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/widgets/app_bar_widget.dart';
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

  void _configureTask(int categoryIndex, int? taskIndex) {
    Navigator.of(context).pushNamed(
      RouteAliasData.task,
      arguments: TaskIndexData(
        categoryIndex: categoryIndex,
        taskIndex: taskIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _bodyWidget = [
      HomePageProvider(
        model: HomePageModel(),
        child: _HomeTasksListWidget(
          handleEditCategory: _editCategory,
          handelConfigureTask: _configureTask,
        ),
      ),
      ArchiveModelProvider(
        model: ArchiveModel(),
        child: _HomeArchivesWidget(),
      ),
    ];

    return Scaffold(
      key: GlobalKeysCollection.scaffoldKey,
      backgroundColor: ColorThemeShelf.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(
              type: AppBarWidgetType.main,
              title: 'Home',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingConsts.horizontal,
              ),
              child: TapBarWidget(
                currentIndex: _tabIndex,
                items: const <TapBarWidgetItem>[
                  TapBarWidgetItem(text: 'Task List'),
                  TapBarWidgetItem(text: 'Archived')
                ],
                onTap: _changeTabIndex,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _bodyWidget[_tabIndex],
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTasksListWidget extends StatelessWidget {
  final void Function(int) handleEditCategory;
  final void Function(int, int?) handelConfigureTask;

  const _HomeTasksListWidget({
    required this.handleEditCategory,
    required this.handelConfigureTask,
  });

  @override
  Widget build(BuildContext context) {
    final _model = HomePageProvider.of(context)!.model;
    final int categoryIndex = _model.categoryIndex;

    return Column(
      children: [
        CategoriesWidget(
          categoris: _model.categories,
          selectedIndex: _model.categoryIndex,
          handleChangeCategory: _model.changeCategoryIndex,
          handleEditCategory: handleEditCategory,
        ),
        const SizedBox(height: 33),
        Expanded(
          child: TaskListWidget(
            tasks: _model.tasks,
            isButtonAvailable: _model.isTasksAvailable,
            selectAllTasks: _model.selectAllTasks,
            toggleTaskIsDone: _model.toggleTaskIsDone,
            toggleTaskIsMarked: _model.toggleTaskIsMarked,
            handelConfigureTask: (int? index) =>
                handelConfigureTask(categoryIndex, index),
            handleArchiveTask: _model.handleArchiveTask,
            handleDeleteTask: _model.handleDeleteTask,
          ),
        ),
      ],
    );
  }
}

class _HomeArchivesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _model = ArchiveModelProvider.of(context)!.model;

    return ArchiveListWidget(
      archivedTasks: _model.archives,
      clearArchivedTasks: _model.clearArchivedTasks,
      handleUnarchiveTask: _model.handleUnarchiveTask,
      handleDeleteTask: _model.handleDeleteTask,
    );
  }
}
