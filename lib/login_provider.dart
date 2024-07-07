import 'package:flutter/material.dart';
import 'package:noviindus_task3/secrets.dart';
import 'home_screen.dart';
import 'login_model.dart';
import 'login_repository.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository _loginRepository = LoginRepository();
  Login? _login;
  String? _message;
  bool _isLoading = false;

  Login? get login => _login;
  String? get message => _message;
  bool get isLoading => _isLoading;

  Future<void> loginUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    _isLoading = true;
    notifyListeners();

    _login = await _loginRepository.login(username, password);
    if (_login != null) {
      Secrets.apiKey = _login?.accessToken ?? '';
      Secrets.token = _login?.refreshToken ?? '';
      _message = _login?.message;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_message ?? 'Login failed')),
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
