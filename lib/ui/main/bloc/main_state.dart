
import 'package:equatable/equatable.dart';
import 'package:marinoszinonos/ui/home/home_page.dart';

class MainState extends Equatable {
  final String currentPageId;

  const MainState({required this.currentPageId});

  @override
  List<Object> get props => [currentPageId];
}

class PageInitial extends MainState {
  const PageInitial() : super(currentPageId: HomePage.pageId);
}
