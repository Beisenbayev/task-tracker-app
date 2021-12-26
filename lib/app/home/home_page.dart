import 'package:flutter/material.dart';
import 'package:to_do_app/app/home/widgets/categories_widget.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/widgets/tap_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TapBarWidget(
              currentIndex: _index,
              items: const <TapBarWidgetItem>[
                TapBarWidgetItem(text: 'Task List'),
                TapBarWidgetItem(text: 'Completed')
              ],
              onTap: _changeIndex,
            ),
            const SizedBox(height: 24),
            const CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
