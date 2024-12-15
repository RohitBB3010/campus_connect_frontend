import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class AnnouncementAddCubit extends Cubit<AnnouncementAddState> {
  AnnouncementAddCubit() : super(AnnouncementAddState());

  void titleChanged(String title) {
    debugPrint("At title : ${state.imageUrl == null}");
    emit((state).copyWith(title: title));
    debugPrint("At title :${state.imageUrl == null}");
  }

  void contentChanged(String content) {
    emit((state).copyWith(content: content, imageUrl: (state).imageUrl));
  }

  void isSelectedChanged(int selected) {
    List<String> visibilityStatus = ["All", "Members", "Members+Extended"];

    emit((state).copyWith(
        isSelected: selected, visibility: visibilityStatus[selected]));
  }

  void tagChanged(String tag) {
    emit((state).copyWith(tag: tag));
  }

  void imageAdded(List<ImageFile> added) {
    debugPrint("Entry attempted");

    List<ImageFile> images;

    if (state.imageUrl == null) {
      images = added;
    } else {
      images = [...state.imageUrl!, ...added];
    }

    emit((state).copyWith(imageUrl: images));
  }

  void removeImage(ImageFile imageFile) {
    final updatedImages =
        state.imageUrl!.where((file) => file.bytes != imageFile.bytes).toList();
    emit(state.copyWith(imageUrl: updatedImages));
  }
}
