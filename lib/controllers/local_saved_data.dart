import 'package:shared_preferences/shared_preferences.dart';

class LocalSavedData{
  static SharedPreferences? preferences;

  // initialize

static Future<void> init() async{
  preferences = await SharedPreferences.getInstance();
}
// save the userId
static Future<void> saveUserId(String id)async{
  await preferences!.setString("userId", id);
}
// read the UserId
static String getUserId(){
  return preferences!.getString("userId")??"";
}
// save the userName
static Future<void> saveUserName(String name)async{
  await preferences!.setString("name", name);
}
// read the UserName
static String getUserName(){
  return preferences!.getString("name")??"";
}
// save the userPhoneNumber
static Future<void> saveUserPhone(String phone)async{
  await preferences!.setString("phone", phone);
}
// read the UserPhoneNumber
static String getUserPhone(){
  return preferences!.getString("phone")??"";
}


// save the userPhoneNumber
static Future<void> saveUserProfile(String profile)async{
  await preferences!.setString("profile", profile);
}
// read the UserPhoneNumber
static String getUserProfile(){
  return preferences!.getString("profile")??"";
}

// clear all the saved data

static clearAllData(){
  preferences!.clear();
  print("cleared all data from local");
}

}