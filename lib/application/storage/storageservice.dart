import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static String authStoreKey = 'dddd';

  static void storeData({required String key, required data}) {
    _storage.write(key: key, value: jsonEncode(data));
  }

  static Future readData({required String key}) async {
    final String? data = await _storage.read(key: key);
    if (data != null) {
      debugPrint("============== $data  ================");
      return jsonDecode(data);
    } else {
      return null;
    }
  }

  static Future deleteData({required String key}) async {
    await _storage.delete(key: key);
  }
}
