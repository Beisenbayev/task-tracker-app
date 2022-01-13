import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeShelf.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            _TaskPageBody(),
          ],
        ),
      ),
    );
  }
}

class _TaskPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: PaddingConsts.horizontal,
        bottom: PaddingConsts.vertical,
        left: PaddingConsts.horizontal,
      ),
      child: Column(
        children: [
          Row(
            children: [
              _TaskIconWidget(icon: Icons.ballot),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  maxLines: 1,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TextFormField(
              minLines: null,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TaskIconWidget extends StatelessWidget {
  final IconData icon;

  const _TaskIconWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      child: Icon(icon),
    );
  }
}
