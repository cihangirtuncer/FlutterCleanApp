


import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@HiveType(typeId: 1)

@JsonSerializable()
class User {
   @HiveField(0)
  int? id;
   @HiveField(1)
  String? name;
   @HiveField(2)
  String? username;
   @HiveField(3)
  String? email;
  Address? address;
   @HiveField(4)
  String? phone;
   @HiveField(5)
  String? website;
   @HiveField(6)
  Company? company;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

 factory User.fromJson(Map<String, dynamic> json) {
  return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
   return _$UserToJson(this);
  }
}
@JsonSerializable()
class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

 factory Address.fromJson(Map<String, dynamic> json) {
   return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressToJson(this);
  }
}
@JsonSerializable()
class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

 factory Geo.fromJson(Map<String, dynamic> json) {
    return _$GeoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeoToJson(this);
  }
}
@HiveType(typeId: 2)

@JsonSerializable()
class Company {
   @HiveField(0)

  String? name;
   @HiveField(1)

  String? catchPhrase;
   @HiveField(2)

  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

 factory Company.fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }

  Map<String, dynamic> toJson() {
   return _$CompanyToJson(this);
  }
}
