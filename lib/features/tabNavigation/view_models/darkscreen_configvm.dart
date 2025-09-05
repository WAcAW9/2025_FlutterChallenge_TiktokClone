// 데이터에 접근할 수 있어야 함
//

import 'package:flutter/material.dart';
import 'package:tiktokclone/features/tabNavigation/models/darkscreen_config_model.dart';
import 'package:tiktokclone/features/tabNavigation/repos/darkscreen_config_repo.dart';

class DarkscreenConfigvm extends ChangeNotifier {
  // 데이터에 접근할 수 있어야 함 ->repo
  final DarkscreenConfigRepo _repository;

  late final DarkscreenConfigModel _model = DarkscreenConfigModel(
    dark: _repository.isDark(),
  );

  // 초기화
  DarkscreenConfigvm(this._repository);

  //데이터 공개 get 메서드
  bool get isdark => _model.isdark;

  // 데이터 수정 메소드
  void setDark(bool value) {
    //repo에 지정
    _repository.setDark(value);
    // 모델을 수정
    _model.dark = value;
    // 듣고있는 전부에게 알림
    notifyListeners();
  }
}
