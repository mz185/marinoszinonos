
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marinoszinonos/ui/components/source_code/source_code.dart';
import 'package:marinoszinonos/ui/contact/contact_page.dart';
import 'package:marinoszinonos/ui/home/home_page.dart';
import 'package:marinoszinonos/utils/extensions.dart';
import 'package:marinoszinonos/utils/responsive/helpers.dart';
import 'package:marinoszinonos/widgets/theme_switch.dart';

import 'bloc/main_bloc.dart';
import 'bloc/main_event.dart';
import 'bloc/main_state.dart';
import 'main_ui_constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final pageIndex = _pageController.page?.round();
    if (pageIndex != null) {
      BlocProvider.of<MainBloc>(context).add(
          PageChanged(
              pageId: MainUiConstants.pages[pageIndex]
          )
      );
    }
  }

  Widget _getPage(String pageId) {
    switch (pageId) {
      case HomePage.pageId:
        return const HomePage();
      case ContactPage.pageId:
        return const ContactPage();
    }
    return const SizedBox.shrink();
  }

  @override
  build(context) => Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          leadingWidth: context.screenWidth / 2,
          leading: const Padding(
              padding: EdgeInsets.only(
                  left: MainUiConstants.pagePadding
              ),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: SourceCode())
                  ]
              )
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(
                    right: MainUiConstants.pagePadding
                ),
                child: ThemeSwitch(
                    isDarkMode: AdaptiveTheme.of(context).mode.isDark,
                    onChanged: (value) => value
                        ? AdaptiveTheme.of(context).setDark()
                        : AdaptiveTheme.of(context).setLight()
                )
            )
          ]
      ),
      body: Padding(
          padding: const EdgeInsets.all(MainUiConstants.pagePadding),
          child: BlocListener<MainBloc, MainState>(
              listener: (context, state) {
                final pageIndex =
                MainUiConstants.pages.indexOf(state.currentPageId);
                if (pageIndex != -1 && _pageController.hasClients) {
                  _pageController.jumpToPage(pageIndex);
                }
              },
              child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  pageSnapping: responsive(
                      context,
                      desktop: false,
                      mobile: true
                  ),
                  clipBehavior: Clip.none,
                  padEnds: false,
                  itemCount: MainUiConstants.pages.length,
                  itemBuilder: (context, index) =>
                      _getPage(MainUiConstants.pages[index])
              )
          )
      ),
      bottomNavigationBar: BottomAppBar(
          child: Center(
              child: Text(
                  MainUiConstants.copyrightText.replacePlaceholders(
                      values: {
                        'year': DateTime.now().year.toString()
                      }
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center
              )
          )
      )
  );
}
