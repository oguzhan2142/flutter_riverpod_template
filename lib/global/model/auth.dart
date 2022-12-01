import 'package:json_annotation/json_annotation.dart';

import '../cache/cache_manager.dart';
import '../cache/tag.dart';
import 'user.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  final String? token;
  final User? user;

  Auth({
    required this.token,
    required this.user,
  });

  static Auth? _instance;

  static Auth? getInstance() => _instance;

  static void setInstance(Auth? i) {
    _instance = i;

    _instance?.saveToPrefs();
  }

  static Future<bool> initFromLocal() async {
    try {
      Map<String, dynamic>? cachedData = CacheManager.instance.getObject(Tag.AUTH);
      if (cachedData == null) return false;
      var auth = Auth.fromJson(cachedData);
      setInstance(auth);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> removeFromPrefs() => CacheManager.instance.remove(Tag.AUTH);

  Future<void> saveToPrefs() => CacheManager.instance.putObject(Tag.AUTH, toJson());

  Map<String, dynamic> toJson() => _$AuthToJson(this);

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
