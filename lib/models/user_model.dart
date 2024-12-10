import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? name;
  String? emailId;
  List<CommitteeDetails>? committees;
  String? imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({this.name, this.emailId, this.committees});

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class CommitteeDetails {
  String? committeeName;
  String? position;

  factory CommitteeDetails.fromJson(Map<String, dynamic> json) =>
      _$CommitteeDetailsFromJson(json);

  CommitteeDetails({this.committeeName, this.position});

  Map<String, dynamic> toJson() => _$CommitteeDetailsToJson(this);
}
