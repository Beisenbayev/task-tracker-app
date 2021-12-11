import 'package:flutter/material.dart';
import 'package:to_do_app/app/archives/widgets/archive_list_item_widget.dart';
import 'package:to_do_app/core/models/archives_model.dart';
import 'package:to_do_app/core/widgets/navigation_bar.dart';

class ArchivesPage extends StatefulWidget {
  const ArchivesPage({Key? key}) : super(key: key);

  @override
  State<ArchivesPage> createState() => _ArchivesPageState();
}

class _ArchivesPageState extends State<ArchivesPage> {
  final _model = ArchivesModel();

  @override
  Widget build(BuildContext context) {
    return ArchivesModelProvider(
      child: _ArchivesPageContent(),
      model: _model,
    );
  }
}

class _ArchivesPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = ArchivesModelProvider.of(context)!.model;
    final archivesCount = model.archives.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archives'),
      ),
      body: ListView.separated(
        itemCount: archivesCount,
        itemBuilder: (BuildContext context, int index) {
          final archive = model.archives[index];

          return ArchiveListItemWidget(
            index: index,
            title: archive.title,
            subtitle: archive.text,
            handleRemove: model.removeTask,
            handleUnarchive: model.unarchiveTask,
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
