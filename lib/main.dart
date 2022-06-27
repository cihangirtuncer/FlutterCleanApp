import 'package:flutter/material.dart';
import 'package:flutter_clean_app_examples/core/manager/network/network_manager.dart';
import 'package:flutter_clean_app_examples/core/provider/user_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'feature/user/view/user_view.dart';



void main() async {
  NetworkManager.instance.init('https://jsonplaceholder.typicode.com', {});
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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