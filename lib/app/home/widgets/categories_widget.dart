import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/button_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

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
              const SizedBox(height: 26),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
                style: ButtonThemeBox.primaryButton(5, 12),
              )
            ],
          ),
        ),
        // ListView.separated(
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       width: 50,
        //       height: 50,
        //     );
        //   },
        //   separatorBuilder: (BuildContext context, int index) {
        //     return const SizedBox(width: 16);
        //   },
        //   itemCount: 4,
        // ),
      ],
    );
  }
}
