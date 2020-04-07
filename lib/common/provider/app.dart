import 'package:flutter/material.dart';

/// 系统相应状态
class AppState with ChangeNotifier {
  bool _isLogin;

  get isLogin => _isLogin;
  set isLogin(val) => _isLogin = val;

  AppState({bool isLogin = false}) {
    this._isLogin = isLogin;
  }

  // 设置是否登录
  userLogout() {
    _isLogin = false;
    notifyListeners();
  }
}
