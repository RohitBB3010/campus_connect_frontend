import 'dart:ui';

class Announcement {
  String? title;
  String? content;
  String? writtenBy;
  String? committeeName;
  Image? cover;
  DateTime? publishDate;

  Announcement(
      {this.title,
      this.content,
      this.writtenBy,
      this.committeeName,
      this.cover,
      this.publishDate});
}
