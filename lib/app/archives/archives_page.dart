import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/navigation_bar.dart';

class ArchivesPage extends StatefulWidget {
  const ArchivesPage({Key? key}) : super(key: key);

  @override
  State<ArchivesPage> createState() => _ArchivesPageState();
}

class _ArchivesPageState extends State<ArchivesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archives'),
      ),
      body: const Center(
        child: Text('archives'),
      ),
      bottomNavigationBar: NavigationBarWidget.content(context),
    );
  }
}
