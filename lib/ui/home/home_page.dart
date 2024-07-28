
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marinoszinonos/ui/home/social_accounts.dart';
import 'package:marinoszinonos/ui/main/bloc/main_bloc.dart';
import 'package:marinoszinonos/ui/main/bloc/page_event.dart';
import 'package:marinoszinonos/utils/responsive/helpers.dart';
import 'package:marinoszinonos/widgets/auto_size_text.dart';
import 'package:marinoszinonos/widgets/fade_in_widget.dart';
import 'package:marinoszinonos/widgets/height.dart';

import 'home_ui_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const pageId = 'home';

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
              children: HomeUiConstants.buttons.map((button) => ElevatedButton(
                  onPressed: () => BlocProvider.of<MainBloc>(context)
                      .add(ButtonPressed(button.id)),
                  child: Text(button.label)
              )).toList()
          )
        ]
    );
  }
}