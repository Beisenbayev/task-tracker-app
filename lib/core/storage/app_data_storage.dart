import 'package:shared_preferences/shared_preferences.dart';

class LocalValueAliasData {
  static const String firstTime = 'first_time';
  static const String username = 'username';
  static const String profileData = 'profile_data';
}

class LocalValueEditor {
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(LocalValueAliasData.username) ?? '';
    return username;
  }

  static setUsername(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalValueAliasData.username, text);
  }

  static Future<int> getProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final profileData = prefs.getInt(LocalValueAliasData.profileData) ?? 0;
    return profileData;
  }

  static setProfileData(int number) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(LocalValueAliasData.profileData, number);
  }

  static Future<bool> getFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final firstTime = prefs.getBool(LocalValueAliasData.firstTime) ?? true;
    return firstTime;
  }

  static setFirstTime(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LocalValueAliasData.firstTime, value);
  }
}
