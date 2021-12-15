import 'package:flutter/material.dart';
import 'package:to_do_app/app/tasks/widgets/color_picker_widget.dart';
import 'package:to_do_app/core/models/create_task_model.dart';

class CreateTaskPage extends StatelessWidget {
  final _model = CreateTaskModel();

  CreateTaskPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CreateTaskModelProvider(
      model: _model,
      child: _CreateTaskPageContent(),
    );
  }
}

class _CreateTaskPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = CreateTaskModelProvider.of(context)!.model;

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
              onChanged: (value) => model.taskTitle = value,
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 8,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task description',
                alignLabelWithHint: true,
              ),
              onChanged: (value) => model.taskDescription = value,
            ),
            const SizedBox(height: 16),
            ColorPickerWidget(
              changeSelectedColor: (Color color) => model.taskColor = color,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.saveTask(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}
