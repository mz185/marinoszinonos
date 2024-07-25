
import 'package:flutter/material.dart';
import 'package:marinoszinonos/home/home_ui_constants.dart';
import 'package:marinoszinonos/home/social_accounts.dart';
import 'package:marinoszinonos/utils/responsive/helpers.dart';
import 'package:marinoszinonos/widgets/auto_size_text.dart';
import 'package:marinoszinonos/widgets/fade_in_widget.dart';
import 'package:marinoszinonos/widgets/height.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState
    extends State<HomePage>
    with AutomaticKeepAliveClientMixin {

  @override
  get wantKeepAlive => true;

  @override
  build(context) {
    super.build(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInWidget(
              child: AutoSizeText(
                  text: HomeUiConstants.title,
                  style: responsive(
                      context,
                      desktop: Theme.of(context).textTheme.displayLarge,
                      tablet: Theme.of(context).textTheme.displayMedium,
                      mobile: Theme.of(context).textTheme.displaySmall
                  ),
                  textAlign: TextAlign.center
              )
          ),
          const Height(HomeUiConstants.spacingHeight),
          const SocialAccounts(),
          const Height(HomeUiConstants.spacingHeight),
          ButtonBar(
              alignment: MainAxisAlignment.center,
              children: List.generate(
                  HomeUiConstants.buttonLabels.length,
                      (index) => ElevatedButton(
                      onPressed: () {},
                      child: Text(HomeUiConstants.buttonLabels[index])
                  )
              )
          )
        ]
    );
  }
}