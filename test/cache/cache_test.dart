import 'package:flutter_clean_app_examples/core/manager/cache/user_cache_manager.dart';
import 'package:flutter_clean_app_examples/feature/user/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  late UserCacheManager userCacheManager;
  List<User>? _items;
  List<User>? _itemsAllValues;

  setUp(() async {
    Hive.init('database');
    userCacheManager = UserCacheManager("database");
    await userCacheManager.init();
  });
  group("UserCacheManager testing", () {
    test(("putItem and getItem method "), () async {
      await userCacheManager.putItem("name", User(name: "cihangir"));
      expect(userCacheManager.getItem("name")?.name.toString(), "cihangir");
    });

    test("getValues method", () {
      _items = userCacheManager.getValues();
      expect(_items?.first.name, "cihangir");
    });

    test("addItems method", () async {
      await userCacheManager.putItem("name2", User(name: "emirhan"));
      await userCacheManager.addItems(_items);
      _itemsAllValues = userCacheManager.getValues();
    
      expect(_itemsAllValues?.last.name, "emirhan");
    });
      test("removeItem method", () async {
      await userCacheManager.removeItem("name2"); 
           _itemsAllValues = userCacheManager.getValues();   
          print(_itemsAllValues?.last.name);
              expect(_itemsAllValues?.last.name, "cihangir");

    });

  
  });
}
/*
  group(("Hive main examples group"), () {
    
    
    
    test("Add examples", () async {
      final box = await Hive.openBox('examples');
      box.add("cihangir");
      expect(box.values.first, "cihangir");
    });

    test(("Put examples"), () async {
      final themeBox = await Hive.openBox<bool>("theme");
      await themeBox.put("theme", true);
      expect(themeBox.get("theme"), true);
    });

    test("Name box create and put", () async {
      final boxList = await Hive.openBox<String>('examples2');
      List<String> items = List.generate(100, (index) => '$index');
      await boxList.addAll(items);
      expect(boxList.values.first, '0');
    });



  });
}*/
