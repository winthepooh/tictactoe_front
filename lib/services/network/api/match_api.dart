import 'package:dio/dio.dart';
import 'package:tictactoe/services/network/api_client.dart';
import 'package:tictactoe/services/network/api_constant/api_endpoint.dart';

class MatchApi {
  MatchApi({
    required this.apiClient,
  });

  final ApiClient apiClient;

  Future<Response<dynamic>> getHistory() async {
    try {
      final response =
          await apiClient.get<dynamic>(ApiEndpoint.match_gethistory);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> playWithAi(int id) async {
    try {
      final response = await apiClient
          .post<dynamic>(ApiEndpoint.match_playwithai, data: {"winner_id": id});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> findMatch(int id) async {
    try {
      final response = await apiClient
          .post<dynamic>(ApiEndpoint.match_find, data: {"user_id": id});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> findInfo(String id) async {
    try {
      final response =
          await apiClient.get<dynamic>("${ApiEndpoint.match_info}$id");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> setWinner(String match_id, int winner_id) async {
    try {
      final response = await apiClient.post<dynamic>(
          ApiEndpoint.match_setwinner,
          data: {"match_id": match_id, "user_id": winner_id});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
