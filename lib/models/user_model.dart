import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? name;
  String? email;
  List<CommitteeDetails>? committees;
  String? imageUrl;

  User({this.name, this.email, this.committees});
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
