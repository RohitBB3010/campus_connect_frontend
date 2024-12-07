// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      name: json['name'] as String?,
      email: json['email'] as String?,
      committees: (json['committees'] as List<dynamic>?)
          ?.map((e) => CommitteeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'committees': instance.committees,
    };

CommitteeDetails _$CommitteeDetailsFromJson(Map<String, dynamic> json) =>
    CommitteeDetails(
      committeeName: json['committeeName'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$CommitteeDetailsToJson(CommitteeDetails instance) =>
    <String, dynamic>{
      'committeeName': instance.committeeName,
      'role': instance.role,
    };
