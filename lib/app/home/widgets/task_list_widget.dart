import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/storage/icon_data_storage.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/task_item_widget.dart';
import 'package:to_do_app/hive/entity/task.dart';

class TaskListWidget extends StatelessWidget {
  final List<Task> tasks;
  final void Function(int?) handelConfigureTask;

  const TaskListWidget({
    Key? key,
    required this.tasks,
    required this.handelConfigureTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _TaskListWidgetTitle(
            handleAddNewTask: () => handelConfigureTask(null),
          ),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffcccccc)),
          const SizedBox(height: 25),
          Expanded(
            child: _TaskListWidgetItems(tasks: tasks),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Select All Task'),
            style: ButtonThemeShelf.primaryButton(20, 35),
          )
        ],
      ),
    );
  }
}

class _TaskListWidgetTitle extends StatelessWidget {
  final void Function() handleAddNewTask;

  const _TaskListWidgetTitle({required this.handleAddNewTask});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Task List', style: TextThemeShelf.title(18)),
        ElevatedButton(
          onPressed: handleAddNewTask,
          child: const Text('Add Task'),
          style: ButtonThemeShelf.primaryButton(17, 25),
        )
      ],
    );
  }
}

class _TaskListWidgetItems extends StatelessWidget {
  final List<Task> tasks;

  const _TaskListWidgetItems({
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final Task task = tasks[index];
        final icon = IconsCollection.icons[task.iconId];

        return TaskItemWidget(
          icon: icon,
          title: task.title,
          isDone: task.isDone,
          isMarked: task.isMarked,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: tasks.length,
    );
  }
}
