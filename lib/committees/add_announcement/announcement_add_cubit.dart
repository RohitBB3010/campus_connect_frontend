import 'dart:convert';

import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:http/http.dart' as http;

class AnnouncementAddCubit extends Cubit<AnnouncementAddState> {
  AnnouncementAddCubit() : super(AnnouncementAddState());

  Future<void> addAnnouncement(String title, String? content, String? tag,
      String? visibility, String? committeeId, List<ImageFile>? images) async {
    var url = "http://10.0.2.2:8000/committee/add-announcement";

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields['title'] = title;
    request.fields['content'] = content!;
    request.fields['tag'] = tag!;
    request.fields['visibility'] = visibility!;
    request.fields['committee_id'] = committeeId!;
    request.fields['userEmail'] = FirebaseAuth.instance.currentUser!.email!;

    if (images != null) {
      for (var image in images) {
        var file = await http.MultipartFile.fromPath('image', image.path!,
            contentType: MediaType('image', 'jpeg'));
        request.files.add(file);
      }
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("File uploaded successfully");
      } else {
        debugPrint("error uploading");
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

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
