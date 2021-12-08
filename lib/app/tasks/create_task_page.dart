import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CreateTaskPageContent();
  }
}

class _CreateTaskPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _TitleInputWidget(),
            const SizedBox(height: 16),
            _TextInputWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.done),
      ),
    );
  }
}

class _TitleInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Task title',
      ),
      onChanged: (value) => print(value),
    );
  }
}

class _TextInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 8,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Task description',
        alignLabelWithHint: true,
      ),
      onChanged: (value) => print(value),
    );
  }
}
