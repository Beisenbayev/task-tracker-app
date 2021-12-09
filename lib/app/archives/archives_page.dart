import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/navigation_bar.dart';

class ArchivesPage extends StatelessWidget {
  const ArchivesPage({Key? key}) : super(key: key);

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
