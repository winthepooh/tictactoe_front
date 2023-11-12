import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tictactoe/domain/model/user/user_model.dart';
import 'package:tictactoe/services/network/api/user_api.dart';
import 'package:tictactoe/services/network/api_client.dart';
import 'package:tictactoe/services/network/api_exception.dart';

class UserRepository {
  final UserApi api;

  const UserRepository({required this.api});

  Future<UserModel?> login(String username, String password) async {
    try {
      Map<String, dynamic> response =
          (await api.login(username, password)).data;

      UserModel user = UserModel.fromJson(response);
      GetIt.I<ApiClient>().changeAuthToken(user.accessToken!);
      return user;
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
      return null;
    }
  }

  Future<bool> register(Map<String, dynamic> data) async {
    try {
      (await api.register(data)).data;
      return true;
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
      return false;
    }
  }

  Future<String> getName(int id) async {
    try {
      Map<String, dynamic> res = (await api.getname(id)).data;
      return res["username"];
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
      return "";
    }
  }
}
