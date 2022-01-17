import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/storage/icon_data_storage.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/input_theme.dart';

class TaskSettingsWidget extends StatelessWidget {
  const TaskSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = TaskModelProvider.of(context)!.model;
    final onPressed =
        _model.title.isEmpty ? null : () => _model.saveNewTask(context);
    final buttonStyle = _model.title.isEmpty
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
        children: [
          Row(
            children: [
              _TaskIconWidget(icon: IconsCollection.icons[_model.iconId]),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  initialValue: _model.title,
                  onChanged: _model.handleChangeTitle,
                  maxLines: 1,
                  decoration: InputThemeShelf.outlineInput('Title'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 2, color: Color(0xffcccccc)),
          const SizedBox(height: 16),
          TextFormField(
            minLines: 5,
            maxLines: 5,
            initialValue: _model.describtion,
            onChanged: _model.handleChangeDescribtion,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputThemeShelf.outlineInput('Describtion...'),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Save Task'),
            style: buttonStyle,
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
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: ColorThemeShelf.primaryDark,
          width: 1,
        ),
      ),
      child: Icon(icon, size: 32, color: ColorThemeShelf.primaryDark),
    );
  }
}
