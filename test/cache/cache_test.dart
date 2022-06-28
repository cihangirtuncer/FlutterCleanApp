import 'package:flutter_clean_app_examples/core/manager/cache/user_cache_manager.dart';
import 'package:flutter_clean_app_examples/feature/user/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  late UserCacheManager userCacheManager;
  List<User>? items;
  List<User>? itemsAllValues;

  setUp(() async {
    Hive.init('database');
    userCacheManager = UserCacheManager();
    await userCacheManager.init();
  });
  group("UserCacheManager testing", () {
    test(("putItem and getItem method successful "), () async {
      await userCacheManager.putItem("name", User(name: "cihangir"));
      expect(userCacheManager.getItem("name")?.name.toString(), "cihangir");
    });

    test("getValues method successful", () {
      items = userCacheManager.getValues();
      expect(items?.first.name, "cihangir");
    });

    test("addItems method successful", () async {
      await userCacheManager.putItem("name2", User(name: "emirhan"));
      await userCacheManager.addItems(items);
      itemsAllValues = userCacheManager.getValues();

      expect(itemsAllValues?.last.name, "emirhan");
    });
    test("removeItem method successful", () async {
      await userCacheManager.removeItem("name2");
      itemsAllValues = userCacheManager.getValues();
      expect(itemsAllValues?.last.name, "cihangir");
    });
  });
}
