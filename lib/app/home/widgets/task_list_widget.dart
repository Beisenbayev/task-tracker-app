import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/task_item_widget.dart';
import 'package:to_do_app/router/routes.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  void handleAddNewTask(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.task);
  }

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
            handleAddNewTask: handleAddNewTask,
          ),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffcccccc)),
          const SizedBox(height: 25),
          Expanded(child: _TaskListWidgetItems()),
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
  final void Function(BuildContext) handleAddNewTask;

  const _TaskListWidgetTitle({required this.handleAddNewTask});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Task List', style: TextThemeShelf.title(18)),
        ElevatedButton(
          onPressed: () => handleAddNewTask(context),
          child: const Text('Add Task'),
          style: ButtonThemeShelf.primaryButton(17, 25),
        )
      ],
    );
  }
}

class _TaskListWidgetItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final Task task = TasksCollection.tasks[index];
        return TaskItemWidget(
          icon: task.icon,
          title: task.title,
          isDone: task.isDone,
          isMarked: false,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: TasksCollection.tasks.length,
    );
  }
}

class Task {
  final IconData icon;
  final String title;
  final bool isDone;

  Task(this.icon, this.title, this.isDone);
}

class TasksCollection {
  static List<Task> tasks = [
    Task(Icons.mail, 'Email Check', true),
    Task(Icons.work, 'Email Check and Email Check again nad again', false),
    Task(Icons.work, 'Email Check', true),
    Task(Icons.work, 'Email Check', false),
    Task(Icons.work, 'Email Check', false),
    Task(Icons.work, 'Email Check', true),
    Task(Icons.work, 'Email Check', true),
  ];
}
