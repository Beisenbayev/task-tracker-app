import 'package:flutter/material.dart';
import 'package:to_do_app/app/groups/models/groups_model.dart';
import 'package:to_do_app/app/groups/widgets/group_list_item_widget.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
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

  void handleTap(BuildContext context) {
    Navigator.pushNamed(context, '/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    final model = GroupsModelProvider.of(context)!.model;
    final groupsCount = model.groups.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
      ),
      body: ListView.separated(
        itemCount: groupsCount,
        itemBuilder: (BuildContext context, int index) {
          final group = model.groups[index];
          return GroupListItemWidget(
            title: group.name,
            index: index,
            handleRemove: model.removeGroup,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 2);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleTap(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
