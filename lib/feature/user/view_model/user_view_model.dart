import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../core/manager/network/network_manager.dart';
import '../model/user_model.dart';

class UserViewModel extends ChangeNotifier {
  List<User> userViewModelList = [];
  User? user;
  final userPath = '/users';

  Future<void> fetchItem() async {
    final response = await NetworkManager.instance.manager.get(userPath);
    if (response.statusCode == HttpStatus.ok) {
      controlResponse(response);
      notifyListeners();
    }
  }
List<User>? controlResponse(Response<dynamic> response){
  if (response.data != null) {
    for (var data in response.data) {
        userViewModelList.add(User.fromJson(data));
      }
    return userViewModelList;
  }else {
   return null;
  }
 }
}
