import 'package:flutter/material.dart';
import 'package:flutter_clean_app_examples/core/constants/api_constants.dart';
import 'package:flutter_clean_app_examples/core/manager/network/network_manager.dart';
import 'package:flutter_clean_app_examples/core/provider/user_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/manager/cache/user_cache_manager.dart';
import 'feature/user/model/user_model.dart';
import 'feature/user/view/user_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkManager.instance.init(ApiConstants.baseApi, {});
  await Hive.initFlutter();
  await UserCacheManager().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => UserContext(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: UserView()),
    );
  }
}
