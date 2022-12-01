// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String?,
      mail: json['mail'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userType: json['userType'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'mail': instance.mail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userType': instance.userType,
      'status': instance.status,
    };
