import 'package:copy_with_extension/copy_with_extension.dart';
import '../models/user_model.dart';

part 'home_page_state.g.dart';

class HomeState {}

class HomeLoadingState extends HomeState {}

@CopyWith()
class HomeLoadedState extends HomeState {
  int pageNumber;
  User user;

  HomeLoadedState({required this.pageNumber, required this.user});
}

class HomeErrorState extends HomeState {}
