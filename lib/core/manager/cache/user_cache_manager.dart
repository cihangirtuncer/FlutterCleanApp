import 'package:flutter_clean_app_examples/feature/user/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICacheManager<T> {
  final String key;
  Box<User>? _box;

  ICacheManager(this.key);

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  void registerAdapters();

  Future<void> clearAll() async {
    await _box?.clear();
  }

  Future<void> addItems(List<T>? items);
  Future<void> putItems(List<T> items);

  T? getItem(String key);
  List<T>? getValues();

  Future<void> putItem(String key, T item);
  Future<void> removeItem(String key);
}

class UserCacheManager extends ICacheManager<User> {
  UserCacheManager() : super('userCache2');

  @override
  Future<void> addItems(List<User>? items) async {
    await _box?.addAll(items ?? []);
  }

  @override
  Future<void> putItems(List<User> items) async {
    await _box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  User? getItem(String key) {
    return _box?.get(key);
  }

  @override
  Future<void> putItem(String key, User item) async {
    await _box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }

  @override
  List<User>? getValues() {
    return _box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserAdapter());
      Hive.registerAdapter(CompanyAdapter());
    }
  }
}
