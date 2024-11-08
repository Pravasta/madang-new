import 'package:madang_app/data/model/response/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<void> saveAuthData(LoginResponseModel data);
  Future<void> removeAuthData();
  Future<LoginResponseModel> getAuthData();
  Future<bool> isLogin();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  @override
  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_data');
  }

  @override
  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  @override
  Future<LoginResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('auth_data');
    if (data != null) {
      return LoginResponseModel.fromJson(data);
    } else {
      throw Exception('Data not found');
    }
  }

  @override
  Future<void> saveAuthData(LoginResponseModel data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', data.toJson());
  }
}
