

import 'package:flutter_clean_app_examples/core/manager/network/network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late INetworkManager inetworkmanager;
  setUp((){
    inetworkmanager = NetworkManager.instance..init('https://jsonplaceholder.typicode.com', {});
  });
  test("description", () async {
    final response = await inetworkmanager.manager.get('/todos/1'); 
    expect(response, isNotNull);
  });
  tearDown((){});
}