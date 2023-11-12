import 'package:get_it/get_it.dart';
import 'package:tictactoe/domain/repositories/match/match_repository.dart';
import 'package:tictactoe/domain/repositories/user/user_repository.dart';
import 'package:tictactoe/services/network/api/match_api.dart';
import 'package:tictactoe/services/network/api/user_api.dart';
import 'package:tictactoe/services/network/api_client.dart';
import 'package:tictactoe/services/stores/tic_store.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  getIt
    ..registerSingleton(ApiClient())
    ..registerSingleton(UserApi(apiClient: getIt<ApiClient>()))
    ..registerSingleton(UserRepository(api: getIt<UserApi>()))
    ..registerSingleton(TicStore())
    ..registerSingleton(MatchApi(apiClient: getIt<ApiClient>()))
    ..registerSingleton(MatchRepository(api: getIt<MatchApi>()));
}
