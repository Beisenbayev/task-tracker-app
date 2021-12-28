import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 17,
        right: PaddingConsts.horizontal,
        bottom: 20,
        left: PaddingConsts.horizontal,
      ),
      decoration: const BoxDecoration(
        color: ColorsTheme.secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TaskListWidgetTitle(),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffeaeaea)),
          const SizedBox(height: 25),
          _TaskListWidgetItems(),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add Task'),
            style: ButtonThemeBox.primaryButton(14, 25),
          )
        ],
      ),
    );
  }
}

class _TaskListWidgetTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Task List', style: TextThemeBox.title),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add Task'),
          style: ButtonThemeBox.primaryButton(14, 25),
        )
      ],
    );
  }
}

class _TaskListWidgetItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
