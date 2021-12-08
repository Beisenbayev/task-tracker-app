import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/tasks_model.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final model = TasksModel();

  @override
  Widget build(BuildContext context) {
    return TasksModelProvider(
      child: _TasksPageContent,
      model: model,
    );
  }
}

class _TasksPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = TasksModelProvider.of(context)!.model;
    final tasksCount = model.tasks.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: ListView.separated(
        itemCount: tasksCount,
        itemBuilder: (BuildContext context, int index) => Container(),
        separatorBuilder: (BuildContext context, int index) => Container(),
      ),
    );
  }
}
