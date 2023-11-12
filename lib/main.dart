import 'package:flutter/material.dart';
import 'package:tictactoe/di/service_locator.dart';
import 'package:tictactoe/presentation/pages/app/app.dart';
import 'package:tictactoe/url_configs/url_native.dart'
    if (dart.library.html) 'package:tictactoe/url_configs/url_native.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await AppEnv.initial(FlavorEnvironment.development.value);
  await setUp();
  runApp(const App());
  urlConfig();
}
