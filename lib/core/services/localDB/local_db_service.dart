import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';

import '../../../data/models/response/user.dart';
import 'package:encrypt_shared_preferences/provider.dart';

class LocalDBService {
  late final EncryptedSharedPreferences _preferences;
  final String encrypteKey = 'f4dn7av65hd4@%h_';
  Future<void> init() async {
    await EncryptedSharedPreferences.initialize(encrypteKey);
    _preferences = EncryptedSharedPreferences.getInstance();
  }

  LoginResponse? getUser() {
    String? data = _getFromDisk(LoginResponse.key());
    if (data != null) {
      LoginResponse loginResponse = LoginResponse.fromJson(convert.jsonDecode(data));
      if (kDebugMode) {
        print("access token ===> ${loginResponse.accessToken}");
      }
      return loginResponse;
    }
    return null;
  }

  Future<void> saveToDisk(String key, dynamic content) async {
    if (content is String) {
      await _preferences.setString(key, content);
    }
    if (content is bool) {
      await _preferences.setBoolean(key, content);
    }
    if (content is int) {
      await _preferences.setInt(key, content);
    }
    if (content is double) {
      await _preferences.setDouble(key, content);
    }

    if (content is Map) {
      String jsonValue = convert.jsonEncode(content);
      await _preferences.setString(key, jsonValue);
    }
  }

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);
    return value;
  }

  void remove(String key) {
    _preferences.remove(key);
  }

  Future<void> removeEveryThing() async {
    await _preferences.clear();
  }
}
