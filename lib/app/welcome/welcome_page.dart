import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';
import 'package:to_do_app/router/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  void handleLetsStart(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteAliasData.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeShelf.welcomeBackground,
      body: Stack(
        children: [
          _WelcomePageBackgroundWidget(),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(
              right: PaddingConsts.horizontal,
              bottom: 100,
              left: PaddingConsts.horizontal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Plan your Day in Details',
                  style: TextThemeShelf.title(32),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 26),
                Text(
                  'There are many variations of passagesThere are many variations.',
                  style: TextThemeShelf.subtitle(18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 26),
                _WelcomePageButtonWidget(
                  handleLetsStart: () => handleLetsStart(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomePageBackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(
        right: 44,
      ),
      child: const Image(
        image: AssetImage('assets/images/welcome_page_bg.png'),
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
      ),
    );
  }
}

class _WelcomePageButtonWidget extends StatelessWidget {
  final void Function() handleLetsStart;

  const _WelcomePageButtonWidget({
    Key? key,
    required this.handleLetsStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xffb0b0b0)),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Center(
        child: GestureDetector(
          onTap: handleLetsStart,
          child: Container(
            width: 66,
            height: 66,
            decoration: const BoxDecoration(
              color: ColorThemeShelf.primaryDark,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: const Image(
              image: AssetImage('assets/icons/arrow_right.png'),
            ),
          ),
        ),
      ),
    );
  }
}
