import 'dart:convert';

import 'package:campus_connect_frontend/committees/add_events/add_event_state.dart';
import 'package:campus_connect_frontend/models/committee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit() : super(AddEventState());

  Future<void> fetchMembers(String committeeId) async {
    try {
      String fetchMembersUri =
          "http://10.0.2.2:8000/committee/fetch-members?commId=$committeeId";

      final response = await http.get(Uri.parse(fetchMembersUri));

      final responseBody = jsonDecode(response.body);

      List<MemberDetails> members = [];

      debugPrint(response.statusCode.toString());

      for (Map<String, dynamic> item in responseBody['members']) {
        MemberDetails member = MemberDetails.fromJson(item);
        members.add(member);
      }

      if (response.statusCode == 200) {
        emit(state.copyWith(members: members));
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void eventNameChanged(String eventName) {
    emit(state.copyWith(eventName: eventName));
  }

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void tagChanged(String tag) {
    emit(state.copyWith(tag: tag));
  }

  void venueChanged(String venue) {
    emit(state.copyWith(venue: venue));
  }

  void startTimeChanged(DateTime startTime) {
    emit(state.copyWith(startTime: startTime));
  }

  void endTimeChanged(DateTime endTime) {
    emit(state.copyWith(endTime: endTime));
  }

  void registrationLinkChanged(String registrationLink) {
    emit(state.copyWith(registrationLink: registrationLink));
  }

  void registrationRequiredChanged(bool registrationRequired) {
    emit(state.copyWith(registrationRequired: registrationRequired));
  }

  void registrationDeadlineChanged(DateTime registrationDeadline) {
    emit(state.copyWith(registrationDeadline: registrationDeadline));
  }

  void eligibilityChanged(String eligibility) {
    emit(state.copyWith(eligibility: eligibility));
  }

  void headChanged(MemberDetails head) {
    emit(state.copyWith(head: head));
  }

  void imageAdded(List<ImageFile> added) {
    List<ImageFile> images;

    if (state.images == null) {
      images = added;
    } else {
      images = [...state.images!, ...added];
    }

    emit((state).copyWith(images: images));
  }

  void removeImage(ImageFile imageFile) {
    final updatedImages =
        state.images!.where((file) => file.bytes != imageFile.bytes).toList();
    emit(state.copyWith(images: updatedImages));
  }

  void coHeadChanged(MemberDetails coHead) {
    emit(state.copyWith(coHead: coHead));
  }
}
