import 'package:flutter_clean_app_examples/core/manager/network/network_manager.dart';
import 'package:flutter_clean_app_examples/feature/user/view_model/user_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserViewModel userViewModel;
setUp((){
userViewModel = UserViewModel();
});
test(("description"), () async{
  
  final response = userViewModel.userModel;
  expect(response, isNotNull);
});



}