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
  final bool isButtonAvailable;
  final void Function(int?) handelConfigureTask;
  final void Function(int) toggleTaskIsDone;
  final void Function(int) handleArchiveTask;
  final void Function(int) handleDeleteTask;

  const TaskListWidget({
    Key? key,
    required this.tasks,
    required this.isButtonAvailable,
    required this.handelConfigureTask,
    required this.toggleTaskIsDone,
    required this.handleArchiveTask,
    required this.handleDeleteTask,
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
            isButtonAvailable: isButtonAvailable,
            handleAddNewTask: () => handelConfigureTask(null),
          ),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffcccccc)),
          const SizedBox(height: 25),
          Expanded(
            child: _TaskListWidgetItems(
              tasks: tasks,
              toggleTaskIsDone: toggleTaskIsDone,
              handleArchiveTask: handleArchiveTask,
              handleDeleteTask: handleDeleteTask,
            ),
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
  final bool isButtonAvailable;
  final void Function() handleAddNewTask;

  const _TaskListWidgetTitle({
    required this.isButtonAvailable,
    required this.handleAddNewTask,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = isButtonAvailable ? handleAddNewTask : null;
    final style = isButtonAvailable
        ? ButtonThemeShelf.primaryButton(17, 25)
        : ButtonThemeShelf.disabledButton(17, 25);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Task List', style: TextThemeShelf.title(18)),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Add Task'),
          style: style,
        )
      ],
    );
  }
}

class _TaskListWidgetItems extends StatelessWidget {
  final List<Task> tasks;
  final void Function(int) toggleTaskIsDone;
  final void Function(int) handleArchiveTask;
  final void Function(int) handleDeleteTask;

  const _TaskListWidgetItems({
    required this.tasks,
    required this.toggleTaskIsDone,
    required this.handleArchiveTask,
    required this.handleDeleteTask,
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
          toggleIsDone: () => toggleTaskIsDone(index),
          archiveTask: () => handleArchiveTask(index),
          deleteTask: () => handleDeleteTask(index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: tasks.length,
    );
  }
}
