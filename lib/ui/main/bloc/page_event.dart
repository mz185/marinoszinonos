
import 'package:equatable/equatable.dart';
import 'package:marinoszinonos/ui/abstract/button_id.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();
}

final class ButtonPressed extends MainEvent {
  final ButtonId buttonId;

  const ButtonPressed(this.buttonId);

  @override
  List<Object> get props => [buttonId];
}

final class PageChanged extends MainEvent {
  final String pageId;

  const PageChanged(this.pageId);

  @override
  List<Object> get props => [pageId];
}
