import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/storage/icon_data_storage.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/archive_item_widget.dart';
import 'package:to_do_app/hive/entity/archive.dart';

class ArchiveListWidget extends StatelessWidget {
  final List<Archive> archivedTasks;
  final void Function() clearArchivedTasks;
  final void Function(int) handleUnarchiveTask;
  final void Function(int) handleDeleteTask;

  const ArchiveListWidget({
    Key? key,
    required this.archivedTasks,
    required this.clearArchivedTasks,
    required this.handleUnarchiveTask,
    required this.handleDeleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed = archivedTasks.isEmpty ? null : clearArchivedTasks;
    final buttonStyle = archivedTasks.isEmpty
        ? ButtonThemeShelf.disabledButton(20, 35)
        : ButtonThemeShelf.primaryButton(20, 35);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 17,
        right: PaddingConsts.horizontal,
        bottom: 20,
        left: PaddingConsts.horizontal,
      ),
      decoration: const BoxDecoration(
        color: ColorThemeShelf.secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _ArchiveListWidgetTitle(),
          const SizedBox(height: 15),
          const Divider(height: 2, color: Color(0xffcccccc)),
          const SizedBox(height: 25),
          Expanded(
            child: _ArchiveListWidgetItems(
              archivedTasks: archivedTasks,
              handleUnarchiveTask: handleUnarchiveTask,
              handleDeleteTask: handleDeleteTask,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Remove All Tasks'),
            style: buttonStyle,
          )
        ],
      ),
    );
  }
}

class _ArchiveListWidgetTitle extends StatelessWidget {
  const _ArchiveListWidgetTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Archive List', style: TextThemeShelf.title(18)),
      ],
    );
  }
}

class _ArchiveListWidgetItems extends StatelessWidget {
  final List<Archive> archivedTasks;
  final void Function(int) handleUnarchiveTask;
  final void Function(int) handleDeleteTask;

  const _ArchiveListWidgetItems({
    required this.archivedTasks,
    required this.handleUnarchiveTask,
    required this.handleDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final Archive task = archivedTasks[index];
        final icon = IconsCollection.icons[task.iconId];

        return ArchiveItemWidget(
          icon: icon,
          title: task.title,
          isDone: task.isDone,
          isMarked: task.isMarked,
          unarchiveTask: () => handleUnarchiveTask(index),
          deleteTask: () => handleDeleteTask(index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: archivedTasks.length,
    );
  }
}
