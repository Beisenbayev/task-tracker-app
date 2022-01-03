import 'package:flutter/material.dart';
import 'package:to_do_app/app/category/widgets/category_prototype_widget.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/widgets/rounded_button.dart';

class CreateCategoryPage extends StatelessWidget {
  const CreateCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: PaddingConsts.horizontal,
            bottom: PaddingConsts.vertical,
            left: PaddingConsts.horizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoryPrototypeWidget(
                color: Color(0xFFFFFCE3),
                activeColor: Color(0xFFFFF387),
                icon: Icons.work,
                title: 'Works',
              ),
              Expanded(child: Container()),
              _CreateCategoryPageButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateCategoryPageButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomRoundedButton(),
        CustomRoundedButton(
          icon: Icons.done,
        ),
      ],
    );
  }
}
