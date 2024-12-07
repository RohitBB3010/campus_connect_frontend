import 'package:campus_connect_frontend/models/member_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Committee {
  String? id;
  String? name;
  List<Member>? members;
  List<String>? announcements;
  Committee({this.id, this.name, this.members, this.announcements});
}

class MembersData {
  String? name;
  String? email;
  String? position;

  MembersData({this.name, this.email, this.position});
}
