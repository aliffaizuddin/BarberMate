import 'package:my_app/Login/Models/loginModel.dart';
import 'package:my_app/Login/Services/Login/LoginService.dart';

// defining login service to make use of internal memory approach

class LoginServiceMemoryImpl implements LoginService {
  final List<LoginModel> _login = [
    LoginModel("user1", "barber", "pass1"),
    LoginModel("user2", "customer", "pass2"),
    LoginModel("user3", "barber", "pass3")
  ];

  @override
  Future<LoginModel> addUser(LoginModel login) async {
    String username = "${int.parse(_login.last.username) + 1}";
    login.username = username;
    _login.add(login);
    return login;
  }

  @override
  Future<void> deleteUser(String username, String password) async {
    _login.removeWhere(
        (login) => login.username == username && login.password == password);
  }

  @override
  Future<List<LoginModel>> getAllUser() async {
    return _login;
  }

  @override
  Future<LoginModel> getUserByUsername(String username) async {
    LoginModel result =
        _login.firstWhere((login) => login.username == username);
    return result;
  }

  @override
  Future<LoginModel> updateUser(
      String username, String type, String password) async {
    int index = _login.indexWhere((login) => login.username == username);
    _login[index] = LoginModel(username, type, password);
    return LoginModel(username, type, password);
  }

  @override
  Future<LoginModel> getUserByPassword(String password) async {
    LoginModel result = _login.lastWhere((login) => login.password == password);
    return result;
  }

}
