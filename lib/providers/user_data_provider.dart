import 'package:chat/Screens/chat.dart';
import 'package:chat/controllers/appwrite_controllers.dart';
import 'package:chat/controllers/local_saved_data.dart';
import 'package:chat/models/user_data.dart';
import 'package:flutter/cupertino.dart';

class UserDataProvider extends ChangeNotifier {
  String _userId = "";
  String _userName = "";
  String _userProfilePic = "";
  String _userPhoneNumber = "";
  String _userDeviceToken = "";

  String get getUserId => _userId;

  String get getUserName => _userName;

  String get ge_userProfilePic => _userProfilePic;

  String get getUserPhoneNumber => _userPhoneNumber;

  String get getUserDeviceToken => _userDeviceToken;

  // to load the data from the device
  void loadDataFromLocal() {
    _userId = LocalSavedData.getUserId();
    _userPhoneNumber = LocalSavedData.getUserPhone();
    _userName = LocalSavedData.getUserName();
    _userProfilePic = LocalSavedData.getUserProfile();
    
    print("Data loaded from local $_userId $_userPhoneNumber $_userName, ________________________________________________________________________________________________________________________");
    notifyListeners();
  }

  //to load  the data from our appwrite database user collection
  void loadUserData(String userId)async{
    UserData? userData = await getUsewrDetails(userId: userId);

    if(userData!=null){
      _userName = userData.name??'';
      _userProfilePic = userData.profilePic??'';
      notifyListeners();
    }
  }
//set User id
  void setUserId(String id) {
    _userId = id;
    LocalSavedData.saveUserId(id);
    notifyListeners();
  }

//set User Phone
  void setUserPhone(String Phone) {
    _userId = Phone;
    LocalSavedData.saveUserPhone(Phone);
    notifyListeners();
  }

//set User Phone
  void setUserName(String Name) {
    _userId = Name;
    LocalSavedData.saveUserName(Name);
    notifyListeners();
  }

//set User Phone
  void setUserProfile(String Profile) {
    _userId = Profile;
    LocalSavedData.saveUserProfile(Profile);
    notifyListeners();
  }

//set device token

  void setDevicetoken(String token) {
    _userDeviceToken = token;
    notifyListeners();
  }
}
