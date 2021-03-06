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
  final void Function() selectAllTasks;
  final void Function(int) toggleTaskIsDone;
  final void Function(int) toggleTaskIsMarked;
  final void Function(int?) handelConfigureTask;
  final void Function(int) handleArchiveTask;
  final void Function(int) handleDeleteTask;

  const TaskListWidget({
    Key? key,
    required this.tasks,
    required this.isButtonAvailable,
    required this.selectAllTasks,
    required this.toggleTaskIsDone,
    required this.toggleTaskIsMarked,
    required this.handelConfigureTask,
    required this.handleArchiveTask,
    required this.handleDeleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed = tasks.isEmpty ? null : selectAllTasks;
    final buttonStyle = tasks.isEmpty
        ? ButtonThemeShelf.disabledButton(20, 35)
        : ButtonThemeShelf.primaryButton(20, 35);

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
              toggleTaskIsMarked: toggleTaskIsMarked,
              handleArchiveTask: handleArchiveTask,
              handleDeleteTask: handleDeleteTask,
              handleEditTask: handelConfigureTask,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Complete All'),
            style: buttonStyle,
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
  final void Function(int) toggleTaskIsMarked;
  final void Function(int) handleArchiveTask;
  final void Function(int) handleDeleteTask;
  final void Function(int) handleEditTask;

  const _TaskListWidgetItems({
    required this.tasks,
    required this.toggleTaskIsDone,
    required this.toggleTaskIsMarked,
    required this.handleArchiveTask,
    required this.handleDeleteTask,
    required this.handleEditTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final Task task = tasks[index];
        final icon = IconsCollection.icons[task.iconId];

        final deleteTask = task.isMarked
            ? () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(task.title),
                    content: const Text(
                        'You have marked this task as important, are you sure you want to delete it?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          handleDeleteTask(index);
                          Navigator.pop(context, 'Delete');
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                )
            : () => handleDeleteTask(index);

        return TaskItemWidget(
          icon: icon,
          title: task.title,
          isDone: task.isDone,
          isMarked: task.isMarked,
          toggleIsDone: () => toggleTaskIsDone(index),
          toggleIsMarked: () => toggleTaskIsMarked(index),
          archiveTask: () => handleArchiveTask(index),
          deleteTask: deleteTask,
          editTask: () => handleEditTask(index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: tasks.length,
    );
  }
}
