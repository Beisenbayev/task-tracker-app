import 'package:flutter/material.dart';
import 'package:to_do_app/app/archives/widgets/archive_list_item_widget.dart';
import 'package:to_do_app/core/widgets/navigation_bar.dart';

class ArchivesPage extends StatefulWidget {
  const ArchivesPage({Key? key}) : super(key: key);

  @override
  State<ArchivesPage> createState() => _ArchivesPageState();
}

class _ArchivesPageState extends State<ArchivesPage> {
  @override
  Widget build(BuildContext context) {
    return _ArchivesPageContent();
  }
}

class _ArchivesPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archives'),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ArchiveListItemWidget(
            index: index,
            title: 'title',
            subtitle: 'subtitle',
            handleRemove: () {},
            handleUnarchive: () {},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 2);
        },
      ),
      bottomNavigationBar: NavigationBarWidget.content(context),
    );
  }
}
