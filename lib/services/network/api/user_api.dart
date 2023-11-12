import 'package:dio/dio.dart';
import 'package:tictactoe/services/network/api_client.dart';
import 'package:tictactoe/services/network/api_constant/api_endpoint.dart';

class UserApi {
  UserApi({
    required this.apiClient,
  });

  final ApiClient apiClient;

  Future<Response<dynamic>> login(String username, String password) async {
    try {
      final response = await apiClient.post<dynamic>(ApiEndpoint.user_login,
          data: {"username": username, "password": password});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> register(Map<String, dynamic> data) async {
    try {
      final response =
          await apiClient.post<dynamic>(ApiEndpoint.user_register, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> getname(int id) async {
    try {
      final response = await apiClient
          .post<dynamic>(ApiEndpoint.user_getname, data: {"user_id": id});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
