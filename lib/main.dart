import 'package:flutter/material.dart';
import 'package:flutter_clean_app_examples/core/manager/network/network_manager.dart';
import 'package:flutter_clean_app_examples/core/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'feature/user/view/user_view.dart';



Future<void> main() async {
  
  NetworkManager.instance.init('https://jsonplaceholder.typicode.com', {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(context) => UserContext(), 
      child: MaterialApp(
        title: 'Material App',
        home: UserViewWidget()
      ),
    );
  }
}