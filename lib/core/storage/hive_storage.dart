import 'package:auvnet_internship_assessment/core/constants/storage_keys.dart';
import 'package:hive/hive.dart';
import 'local_storage.dart';

class HiveStorage implements LocalStorage {
  final Box box;

  HiveStorage(this.box);

  @override
  Future<void> writeBool(StorageKeys key, bool value) async {
    await box.put(key.name, value);
  }

  @override
  Future<bool?> readBool(StorageKeys key) async {
    return box.get(key.name) as bool?;
  }

  @override
  Future<void> delete(StorageKeys key) async {
    await box.delete(key.name);
  }
}
