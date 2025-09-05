// repo : 데이터를 읽고 저장하는 일만 한다.
// firebase 연동을 구현할 때 firebase로부터 데이터를 가져오는 부분

import 'package:shared_preferences/shared_preferences.dart';

class DarkscreenConfigRepo {
  static const _isDark = "isDark"; // key 실수 방지를 위한
  SharedPreferences _preferences;

  DarkscreenConfigRepo(this._preferences);

  // 디스크에 작성
  Future<void> setDark(bool value) async {
    _preferences.setBool(_isDark, value);
  }

  bool isDark() {
    return _preferences.getBool(_isDark) ?? false;
    // 디스크에 저장된 것이 없으면 false로 간주
  }
}
