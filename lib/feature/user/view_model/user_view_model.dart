import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../core/manager/network/network_manager.dart';
import '../model/user_model.dart';

class UserViewModel extends ChangeNotifier {
  List<User> userModel = [];

  Future<void> fetchItem() async {
    final response = await NetworkManager.instance.manager.get('/users');
    if (response.statusCode == HttpStatus.ok) {
      for (var data in response.data) {
        userModel.add(User.fromJson(data));
      }
      controlResponse();
      notifyListeners();
    }
  }

  List<User?>? controlResponse() {
    return userModel;
  }
}
