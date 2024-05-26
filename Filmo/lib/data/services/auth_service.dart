import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _token;

  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;

  Future<void> login(String token) async {
    _isAuthenticated = true;
    _token = token;
    await _saveAuthState();
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _token = null;
    await _clearAuthState();
    notifyListeners();
  }

  Future<void> loadAuthState() async {
    var box = await Hive.openBox('authBox');
    _isAuthenticated = box.get('isAuthenticated', defaultValue: false);
    _token = box.get('token');
    if (_isAuthenticated && _token != null) {
      await verifyToken(_token!);
    } else {
      logout();
    }
    notifyListeners();
  }

  Future<void> verifyToken(String token) async {
    if (JwtDecoder.isExpired(token)) {
      await logout();
    } else {
      _isAuthenticated = true;
    }
    notifyListeners();
  }

  Future<void> _saveAuthState() async {
    var box = await Hive.openBox('authBox');
    await box.put('isAuthenticated', _isAuthenticated);
    await box.put('token', _token);
  }

  Future<void> _clearAuthState() async {
    var box = await Hive.openBox('authBox');
    await box.delete('isAuthenticated');
    await box.delete('token');
  }
}
