import 'package:flutter_clean_app_examples/core/manager/network/network_manager.dart';
import 'package:flutter_clean_app_examples/feature/user/model/user_model.dart';
import 'package:flutter_clean_app_examples/feature/user/view_model/user_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late INetworkManager inetworkManager;

  setUp(() {
    inetworkManager = NetworkManager.instance
      ..init('https://jsonplaceholder.typicode.com', {});
  });

  test(("User view model"), () async {
    final datas = await inetworkManager.manager.get('/users/1');
    print(datas);
    expect(datas, isNotNull);
  });
}
