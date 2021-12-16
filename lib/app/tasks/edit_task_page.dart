import 'package:flutter/material.dart';
import 'package:to_do_app/app/tasks/widgets/color_picker_widget.dart';
import 'package:to_do_app/core/models/edit_task_model.dart';

class EditTaskPage extends StatefulWidget {
  final int taskKey;

  const EditTaskPage({
    Key? key,
    required this.taskKey,
  }) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late final EditTaskModel _model;

  @override
  void initState() {
    super.initState();
    _model = EditTaskModel(widget.taskKey);
  }

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
      appBar: AppBar(title: const Text('Edit Task')),
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
            const SizedBox(height: 16),
            ColorPickerWidget(
              selectedColorId: model.task.colorId,
              changeSelectedColorId: (int id) => model.task.colorId = id,
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
