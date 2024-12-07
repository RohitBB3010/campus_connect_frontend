// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      email: json['email'] as String?,
      committees: (json['committees'] as List<dynamic>?)
          ?.map((e) => CommitteeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..imageUrl = json['imageUrl'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'committees': instance.committees?.map((e) => e.toJson()).toList(),
      'imageUrl': instance.imageUrl,
    };

CommitteeDetails _$CommitteeDetailsFromJson(Map<String, dynamic> json) =>
    CommitteeDetails(
      committeeName: json['committeeName'] as String?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$CommitteeDetailsToJson(CommitteeDetails instance) =>
    <String, dynamic>{
      'committeeName': instance.committeeName,
      'position': instance.position,
    };
