


import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? username;
  String? email;

  User({this.id, this.name, this.username, this.email});

 factory User.fromJson(Map<String, dynamic> json) {
  return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}