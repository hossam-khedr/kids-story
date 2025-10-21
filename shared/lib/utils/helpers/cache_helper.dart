import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPref;
  static void initCacheHelper()async{
    sharedPref = await SharedPreferences.getInstance();
  }
  static Future<dynamic>getData(String key) async {
    return  sharedPref?.get(key);
  }
  static String?getString(String key){

    return sharedPref?.getString(key);
  }

  static Future<bool?>setData(String key,dynamic value)async{

    switch(value){
      case String _:
       return await sharedPref?.setString(key, value);
      case bool _:
        return await sharedPref?.setBool(key, value);
      case double _:
        return await sharedPref?.setDouble(key, value);
      case int _:
        return await sharedPref?.setInt(key, value);
      default:
        throw Exception("Unsupported value type: ${value.runtimeType}");

    }

  }

  static Future<bool?>removeData(String key)async{

    return await sharedPref?.remove(key);
  }
}