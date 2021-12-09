import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/edit_task_model.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({Key? key}) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  EditTaskModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_model == null) {
      final taskKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = EditTaskModel(taskKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return EditTaskModelProvider(
      model: _model!,
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
            TextFormField(
              initialValue: model.task.title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task title',
              ),
              onChanged: (value) => model.task.title = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: model.task.text,
              maxLines: 8,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task description',
                alignLabelWithHint: true,
              ),
              onChanged: (value) => model.task.text = value,
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
