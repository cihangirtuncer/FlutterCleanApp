import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init("database");
  });

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
}
