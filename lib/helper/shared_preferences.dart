import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class SPController {
  setLabourId(value) {
    prefs.setString('labour_id', value);
  }

  getLabourId() {
    return prefs.getString('labour_id');
  }

  setIsLoggedin(value) {
    prefs.setBool('is_login', value);
  }

  getIsLoggedin() {
    var value = prefs.getBool('is_login');
    if (value == null) {
      return false;
    }
    return value;
  }
}
