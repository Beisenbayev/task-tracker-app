import 'package:flutter/material.dart';
import 'package:to_do_app/app/groups/models/groups_model.dart';
import 'package:to_do_app/app/tasks/widgets/task_list_item_widget.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final _model = GroupsModel();

  @override
  Widget build(BuildContext context) {
    return GroupsModelProvider(
      model: _model,
      child: const _GroupsPageBody(),
    );
  }
}

class _GroupsPageBody extends StatelessWidget {
  const _GroupsPageBody({Key? key}) : super(key: key);

  void handleShowForm(BuildContext context) {
    Navigator.pushNamed(context, '/groups/tasks/form');
  }

  @override
  Widget build(BuildContext context) {
    final model = GroupsModelProvider.of(context)!.model;
    final groupsCount = model.groups.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ListView.separated(
        itemCount: groupsCount,
        itemBuilder: (BuildContext context, int index) {
          final group = model.groups[index];
          return TaskListItemWidget(
            title: group.name,
            index: index,
            handleRemove: () {},
            handleTap: () {},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 2);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleShowForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
