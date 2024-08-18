
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marinoszinonos/ui/contact/contact_page.dart';
import 'package:marinoszinonos/ui/home/home_ui_constants.dart';
import 'package:marinoszinonos/ui/main/bloc/main_event.dart';

import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const InitialMainState()) {

    on<ButtonPressed>((event, emit) {
      switch (event.buttonId) {
        // case HomeUiConstants.aboutButtonId:
        //   emit(MainState(currentPageId: ));
        case HomeUiConstants.contactButtonId:
          emit(const MainState(currentPageId: ContactPage.pageId));
      }
    });

    on<PageChanged>((event, emit) {
      emit(MainState(currentPageId: event.pageId));
    });
  }
}
