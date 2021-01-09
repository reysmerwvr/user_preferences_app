import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences_app/src/pages/home_page.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  Future<void> initPreferences() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool _secondaryColor;
  // bool _genre;
  // bool _name;

  get genre {
    return _prefs.getInt('genre') ?? 1;
  }

  set genre(int value) {
    _prefs.setInt('genre', value);
  }

  get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool('secondaryColor', value);
  }

  get userName {
    return _prefs.getString('userName') ?? '';
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

  get lastPage {
    return _prefs.getString('lastPage') ?? HomePage.routeName;
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
