import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_models.g.dart';

@JsonSerializable()
class ProfileEvents {
  String id;
  String title;
  DateTime startDate;
  DateTime endDate;

  ProfileEvents(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate});
}

@JsonSerializable()
class ProfileAnnouncements {
  String id;
  String title;
  String visibility;

  ProfileAnnouncements(
      {required this.id, required this.title, required this.visibility});
}
