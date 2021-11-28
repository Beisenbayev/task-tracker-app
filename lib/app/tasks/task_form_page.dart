import 'package:flutter/material.dart';
import 'package:to_do_app/app/groups/models/group_form_model.dart';

class TasksFormPage extends StatefulWidget {
  const TasksFormPage({Key? key}) : super(key: key);

  @override
  State<TasksFormPage> createState() => _TasksFormPageState();
}

class _TasksFormPageState extends State<TasksFormPage> {
  final _model = GroupFormModel();

  @override
  Widget build(BuildContext context) {
    return GroupFormModelProvider(
      model: _model,
      child: const _TasksFormPageBody(),
    );
  }
}

class _TasksFormPageBody extends StatelessWidget {
  const _TasksFormPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupFormModelProvider.of(context)!.model;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new task'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            maxLines: null,
            minLines: null,
            expands: true,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'New task text',
            ),
            onChanged: (value) => model.title = value,
            onEditingComplete: () => model.saveGroup(context),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.saveGroup(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}
