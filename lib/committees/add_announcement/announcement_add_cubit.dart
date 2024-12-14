import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementAddCubit extends Cubit<AnnouncementAddState> {
  AnnouncementAddCubit() : super(AnnouncementAddState());

  void titleChanged(String title) {
    emit((state).copyWith(title: title));
  }

  void contentChanged(String content) {
    emit((state).copyWith(content: content));
  }

  void isSelectedChanged(int selected) {
    List<String> visibilityStatus = ["All", "Members", "Members+Extended"];

    emit((state).copyWith(
        isSelected: selected, visibility: visibilityStatus[selected]));
  }

  void tagChanged(String tag) {
    emit((state).copyWith(tag: tag));
  }
}
