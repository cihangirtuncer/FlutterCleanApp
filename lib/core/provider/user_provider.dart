import 'package:flutter/cupertino.dart';

class UserContext extends ChangeNotifier {
  Users? user;
}

class Users {
  String? name;

  final String surname;

  int age = 15;

  Users(this.surname, {this.name});
}
