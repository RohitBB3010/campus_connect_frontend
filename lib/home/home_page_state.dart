import 'package:copy_with_extension/copy_with_extension.dart';
import '../models/user_model.dart';

part 'home_page_state.g.dart';

class HomePageState {}

class HomePageLoadingState extends HomePageState {}

@CopyWith()
class HomePageLoadedState extends HomePageState {
  int pageNumber;
  User member;

  HomePageLoadedState({required this.pageNumber, required this.member});
}

class HomePageErrorState extends HomePageState {}
