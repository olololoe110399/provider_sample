import 'package:sample/config/app_shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  late SharedPreferences _preferences;
  static final SharedPrefHelper _singleton = SharedPrefHelper();

  static SharedPrefHelper get instance => _singleton;

  Future<void> setup() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool get isFirstLogin =>
      _preferences.getBool(AppSharedPrefKey.isFirstLogin) ?? false;

  set isFirstLogin(bool value) =>
      _preferences.setBool(AppSharedPrefKey.isFirstLogin, value);
}
