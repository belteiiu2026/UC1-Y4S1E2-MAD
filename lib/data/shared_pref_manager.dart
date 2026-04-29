
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {

  Future<void> initData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("username", "mad@gmail.com");
    await pref.setString("password", "123456");
  }

  Future<void> saveSharedPref(String key, dynamic value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(key,value);
  }

  Future<dynamic> getSharedPref(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key)!;
  }

  Future<void> removeSharedPref(String key) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(key);
  }

}