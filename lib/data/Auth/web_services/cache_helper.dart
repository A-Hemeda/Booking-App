import 'package:shared_preferences/shared_preferences.dart';

// class CacheHelper {
//   static late SharedPreferences sharedPreferences;
//
//   static init() async {
//   //  sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//
//   static dynamic getDataFromSharedPreference({required String key}) {
//     return sharedPreferences.get(key);
//   }
//
//   static Future<bool> saveDataSharedPreference(
//       {required String key, required dynamic value}) async {
//     if (value is bool) {
//       return await sharedPreferences.setBool(key, value);
//     } else if (value is String) {
//       return await sharedPreferences.setString(key, value);
//     } else if (value is int) {
//       return await sharedPreferences.setInt(key, value);
//     } else {
//       return await sharedPreferences.setDouble(key, value);
//     }
//   }
//
//   static Future<bool> removeData({required String key}) async {
//     return await sharedPreferences.remove(key);
//   }
//
//   static Future clearData(){
//     return sharedPreferences.clear();
//   }
// }