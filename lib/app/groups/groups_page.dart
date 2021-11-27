import 'package:flutter/material.dart';
import 'package:to_do_app/app/groups/widgets/group_list_item_widget.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key}) : super(key: key);

  void handleTap(BuildContext context) {
    Navigator.pushNamed(context, '/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
      ),
      body: _GroupsPageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleTap(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupsPageBody extends StatelessWidget {
  const _GroupsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return const GroupListItemWidget(title: 'text');
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 2);
        },
      ),
    );
  }
}
