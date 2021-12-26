import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/core/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingConsts.horizontal,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Categories',
                style: TextThemeBox.title,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
                style: ButtonThemeBox.primaryButton(5, 12),
              )
            ],
          ),
        ),
        const SizedBox(height: 26),
        Container(
          height: 136,
          padding: const EdgeInsets.only(left: PaddingConsts.horizontal),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return const CategoryItemWidget(
                color: Color(0xFFFFFCE3),
                activeColor: Color(0xFFFFF387),
                icon: Icons.work,
                title: 'Works',
                taskCount: 10,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
            itemCount: 9,
          ),
        ),
      ],
    );
  }
}
