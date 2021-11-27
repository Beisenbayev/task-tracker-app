import 'package:flutter/material.dart';

class GroupFormPage extends StatelessWidget {
  const GroupFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new group'),
      ),
      body: const _GroupFormPageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupFormPageBody extends StatelessWidget {
  const _GroupFormPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'New group name',
          ),
          onEditingComplete: () {},
        ),
      ),
    );
  }
}
