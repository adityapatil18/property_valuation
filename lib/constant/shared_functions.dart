import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Singleton pattern
  static SharedPreferencesHelper? _instance;
  factory SharedPreferencesHelper() =>
      _instance ??= SharedPreferencesHelper._();

  SharedPreferencesHelper._();

  // Keys for shared preferences
  static const String authTokenKey = 'authToken';
  static const String userIds = "UserId";

  // Function to save the token to local storage
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(authTokenKey, token);
  }

  // Function to get the token from local storage
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(authTokenKey);
  }

  Future<void> saveUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userIds, userId);
  }

  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIds);
  }
}
