import 'package:dio/dio.dart';
import 'package:flutter_clean_app_examples/core/manager/network/network_manager.dart';
import 'package:flutter_clean_app_examples/feature/user/model/user_model.dart';
import 'package:flutter_clean_app_examples/feature/user/view_model/user_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserViewModel userViewModel;
  setUp(() {
    userViewModel = UserViewModel();
  });
  test(("controlResponse Test"), ()  {
    
    List <Object> userList =  [User(id: 1, name: "cihangir", username: "cihangirSW", email: "cihangirrr").toJson(),User(id: 2, name: "Emirhan", username: "ucanPolonyolai", email: "polish").toJson(),User(id: 3, name: "ege", username: "egeden", email: "egeye").toJson(), ].toList();

    final response = userViewModel.controlResponse(Response(
      data:userList,
      requestOptions: RequestOptions(path: "/hello")));
      print(response?[0].name.toString());
      expect(response?[0].name, "cihangir");

  });
}
