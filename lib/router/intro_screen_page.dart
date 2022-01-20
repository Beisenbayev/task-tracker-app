import 'package:flutter/material.dart';
import 'package:to_do_app/core/storage/app_data_storage.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/router/routes.dart';

class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({Key? key}) : super(key: key);

  @override
  State<IntroScreenPage> createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() async {
    final firstTime = await LocalValueEditor.getFirstTime();
    if (!firstTime) {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushReplacementNamed(RouteAliasData.home);
    } else {
      LocalValueEditor.setFirstTime(false);
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushReplacementNamed(RouteAliasData.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeShelf.primaryBackground,
      body: Center(
        child: Text(
          'LOGO',
          style: TextThemeShelf.title(48),
        ),
      ),
    );
  }
}
