import 'package:campus_connect_frontend/models/committee_model.dart';

class MembersState {}

class MembersLoadingState extends MembersState {}

class MembersLoadedState extends MembersState {
  List<MemberDetails> members;

  MembersLoadedState({required this.members});
}

class MembersErrorState extends MembersState {}
