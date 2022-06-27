
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../core/manager/network/network_manager.dart';
import '../model/user_model.dart';

class UserViewModel extends ChangeNotifier {
 
  
  List <User> userModel=[];
   
  Future<void> fetchItem() async {
    final response = await NetworkManager.instance.manager.get('/users');
    if (response.statusCode == HttpStatus.ok) {
   for (var data in response.data ){
    userModel.add(User.fromJson(jsonDecode(jsonEncode(data))));
   }
         notifyListeners();

    }
  }

  List <User?>? returnList(){
    return userModel;
  }


/*
List<User?>? controlResponse(Response<dynamic> response){
 if (response.data is Map<String, dynamic>) {
 List<dynamic> values;
 print("calisti");
  print("calisti 2");
  if(values.length>0){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic> map=values[i];
            userModel!.add(User.fromJson(map));
            debugPrint('Id-------${map['id']}');
          }
        }
        print("calisti 3");
   return userModel ;
 }else {
  return [];
 } 
}
*/
}
 
 /*
  User? userModel;
   
  Future<void> fetchItem() async {
    final response = await NetworkManager.instance.manager.get('/users/1');
    if (response.statusCode == HttpStatus.ok) {
       userModel = controlResponse(response);
         notifyListeners();

    }
  }

User? controlResponse(Response<dynamic> response){
 if (response.data is Map<String, dynamic>) {
   return User.fromJson(response.data);
 }else {
  return null;
 } 
}
*/

