import 'package:flutter/material.dart';
import 'package:to_do_app/app/groups/models/group_form_model.dart';

class GroupFormPage extends StatefulWidget {
  const GroupFormPage({Key? key}) : super(key: key);

  @override
  State<GroupFormPage> createState() => _GroupFormPageState();
}

class _GroupFormPageState extends State<GroupFormPage> {
  final _model = GroupFormModel();

  @override
  Widget build(BuildContext context) {
    return GroupFormModelProvider(
      model: _model,
      child: const _GroupFormPageBody(),
    );
  }
}

class _GroupFormPageBody extends StatelessWidget {
  const _GroupFormPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupFormModelProvider.of(context)!.model;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new group'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'New group name',
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
