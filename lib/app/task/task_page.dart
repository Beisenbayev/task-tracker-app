import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app/task/widgets/task_prototype_widget.dart';
import 'package:to_do_app/app/task/widgets/task_settings_widget.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/storage/icon_data_storage.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool _isDone = true;

  void _toggleIsDone() {
    setState(() {
      _isDone = !_isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _model = TaskModelProvider.of(context)!.model;

    return Scaffold(
      backgroundColor: ColorThemeShelf.primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox.shrink(), //replasment for navbar
            TaskPrototypeWidget(
              icon: IconsCollection.icons[_model.iconId],
              title: _model.title,
              describtion: _model.describtion,
              isDone: _isDone,
              toggleIsDone: _toggleIsDone,
            ),
            const TaskSettingsWidget(),
          ],
        ),
      ),
    );
  }
}
