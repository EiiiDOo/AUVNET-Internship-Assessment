import 'package:auvnet_internship_assessment/core/constants/storage_keys.dart';

abstract class LocalStorage {
  Future<void> writeBool(StorageKeys key, bool value);
  Future<bool?> readBool(StorageKeys key);
  Future<void> delete(StorageKeys key);
}
