import 'package:dio/dio.dart';
import 'package:tictactoe/domain/model/match/match_model.dart';
import 'package:tictactoe/services/network/api/match_api.dart';
import 'package:tictactoe/services/network/api_exception.dart';

class MatchRepository {
  final MatchApi api;

  const MatchRepository({required this.api});

  Future<List<MatchModel>?> getHistory() async {
    try {
      List<Map<String, dynamic>> response =
          ((await api.getHistory()).data as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList();
      List<MatchModel> ans = [];
      for (Map<String, dynamic> i in response) {
        ans.add(MatchModel.fromJson(i));
      }
      return ans;
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
      return null;
    }
  }
}
