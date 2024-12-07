import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class Member {
  String? name;
  String? email;
  List<CommitteeDetails>? committees;

  Member({
    this.name,
    this.email,
    this.committees,
  });
}

@JsonSerializable()
class CommitteeDetails {
  String? committeeName;
  String? role;

  CommitteeDetails({this.committeeName, this.role});
}
