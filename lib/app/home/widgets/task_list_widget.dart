import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/task_item_widget.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

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
        color: ColorsTheme.secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TaskListWidgetTitle(),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffeaeaea)),
          const SizedBox(height: 25),
          Expanded(child: _TaskListWidgetItems()),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Select All Task'),
            style: ButtonThemeBox.primaryButton(20, 35),
          )
        ],
      ),
    );
  }
}

class _TaskListWidgetTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Task List', style: TextThemeBox.title(18)),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add Task'),
          style: ButtonThemeBox.primaryButton(17, 25),
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
          isSelected: task.isSelected,
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
  final bool isSelected;

  Task(this.icon, this.title, this.isSelected);
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
