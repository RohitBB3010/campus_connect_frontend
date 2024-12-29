import 'package:campus_connect_frontend/models/announcement_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'announcement_state.g.dart';

class AnnouncementState {}

class AnnouncementLoadingState extends AnnouncementState {}

@CopyWith()
class AnnouncementLoadedState extends AnnouncementState {
  List<AnnouncementModel> announcements;
  String userName;
  String profileImage;
  String? filterCommitteeName;
  String? searchTextTitle;

  AnnouncementLoadedState(
      {required this.announcements,
      required this.userName,
      required this.profileImage,
      this.filterCommitteeName,
      this.searchTextTitle});
}

class AnnouncementErrorState extends AnnouncementState {}
