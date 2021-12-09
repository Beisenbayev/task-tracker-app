import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/edit_task_model.dart';

class EditTaskPage extends StatelessWidget {
  final _model = EditTaskModel();

  EditTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditTaskModelProvider(
      model: _model,
      child: _EditTaskPageContent(),
    );
  }
}

class _EditTaskPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = EditTaskModelProvider.of(context)!.model;

    return Scaffold(
      appBar: AppBar(title: const Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task title',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 8,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task description',
                alignLabelWithHint: true,
              ),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.saveTaskChanges(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}
