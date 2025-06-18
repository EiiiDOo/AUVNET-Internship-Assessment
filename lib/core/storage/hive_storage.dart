import 'package:auvnet_internship_assessment/core/constants/local_storage_keys.dart';
import 'package:hive/hive.dart';
import 'local_storage.dart';

class HiveStorage implements LocalStorage {
  final Box box;

  HiveStorage(this.box);

  @override
  Future<void> delete(LocalStorageKeys key) async {
    await box.delete(key.name);
  }

  @override
  Future<void> put(String key, value) async {
    await box.put(key, value);
  }

  @override
  get(String key) async {
    return box.get(key);
  }

  @override
  Future<void> putAll(Map<String, dynamic> values) async {
    await box.putAll(values);
  }
}
