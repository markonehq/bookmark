import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart'; // This file will be generated

@JsonSerializable(
    fieldRename: FieldRename.snake) // Automatically handles snake_case keys
class UserModel {
  String name;
  String avatar;
  String email;
  String uid;

  UserModel({
    required this.name,
    required this.avatar,
    required this.email,
    required this.uid,
  });

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json); // This function will be generated

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() =>
      _$UserModelToJson(this); // This function will be generated
}
