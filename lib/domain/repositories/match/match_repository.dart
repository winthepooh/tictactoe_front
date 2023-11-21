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

  Future<void> playWithAI(int id) async {
    try {
      await api.playWithAi(id);
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
    }
  }

  Future<void> setWinner(String room_id, int id) async {
    try {
      await api.setWinner(room_id, id);
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
    }
  }

  Future<Map<String, dynamic>> findMatch(int id) async {
    try {
      Map<String, dynamic> response = (await api.findMatch(id)).data;
      return response;
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
      return {};
    }
  }

  Future<MatchModel?> getMatchInfo(String id) async {
    try {
      Map<String, dynamic> response = (await api.findInfo(id)).data;
      return MatchModel.fromJson(response);
    } on DioException catch (e) {
      print(ApiException.fromDioException(e).message);
      return null;
    }
  }
}
