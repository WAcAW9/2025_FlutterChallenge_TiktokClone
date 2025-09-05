// 데이터에 접근할 수 있어야 함
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokclone/features/tabNavigation/models/darkscreen_config_model.dart';
import 'package:tiktokclone/features/tabNavigation/repos/darkscreen_config_repo.dart';

// <안에 화면이 listen 하기를 원하는 데이터 삽입
class DarkscreenConfigvm extends Notifier<DarkscreenConfigModel> {
  final DarkscreenConfigRepo _repository;

  // 초기화
  DarkscreenConfigvm(this._repository);

  // 데이터 수정 메소드
  void setDark(bool value) {
    //repo에 지정
    _repository.setDark(value);
    // 모델을 수정
    //_model.dark = value;
    //state.dark = value; // state를 통해 접근
    state = DarkscreenConfigModel(dark: value);

    // 듣고있는 전부에게 알림
    // notifyListeners();
  }

  // Notifier의 필수 요소 사용가자 보게 될 초기 데이터
  @override
  build() {
    // 초기화시 가져올 데이터
    return DarkscreenConfigModel(dark: _repository.isDark());
  }
}

final DarkscreenConfigProvider =
    NotifierProvider<DarkscreenConfigvm, DarkscreenConfigModel>(
      () =>
          throw UnimplementedError(), // 이건 지금만!!쓰는거야! 임시로 sharedPreferences에 접근하기 위해서지.
    );
