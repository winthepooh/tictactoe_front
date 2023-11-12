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
}
