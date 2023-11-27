import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Singleton pattern
  static SharedPreferencesHelper? _instance;
  factory SharedPreferencesHelper() =>
      _instance ??= SharedPreferencesHelper._();

  SharedPreferencesHelper._();

  // Keys for shared preferences
  static const String authTokenKey = 'authToken';

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
}
