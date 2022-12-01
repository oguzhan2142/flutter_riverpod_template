import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String? username;
  final String? mail;
  final String? firstName;
  final String? lastName;
  final String? userType;
  final String? status;

  User({
    this.username,
    this.mail,
    this.firstName,
    this.lastName,
    this.userType,
    this.status,
  });

  String get getFullName => '$firstName $lastName';

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
