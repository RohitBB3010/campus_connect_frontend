import 'package:campus_connect_frontend/models/member_model.dart';

class HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  int pageNumber;
  Member member;

  HomePageLoadedState({required this.pageNumber, required this.member});
}

class HomePageErrorState extends HomePageState {}
