import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'tag.dart';

class CacheManager {
  static final CacheManager instance = CacheManager._();
  CacheManager._();

  late final SharedPreferences prefs;

  void init(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  Future<void> putString(Tag tag, String value) async {
    await prefs.setString(tag.name, value);
  }

  String? getString(Tag tag) {
    return prefs.getString(tag.name);
  }

  Future<void> putObject(Tag tag, Map<String, dynamic> value) async {
    await prefs.setString(tag.name, jsonEncode(value));
  }

  Map<String, dynamic>? getObject(Tag tag) {
    var json = prefs.getString(tag.name);
    if (json == null) return null;

    return jsonDecode(json);
  }

  Future<void> remove(Tag tag) async {
    await prefs.remove(tag.name);
  }
}
