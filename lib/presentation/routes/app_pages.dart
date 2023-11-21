import 'package:get/get.dart';
import 'package:tictactoe/presentation/pages/page_history/controller/history_page_controller.dart';
import 'package:tictactoe/presentation/pages/page_history/history_page.dart';
import 'package:tictactoe/presentation/pages/page_login/controller/login_page_controller.dart';
import 'package:tictactoe/presentation/pages/page_login/login_page.dart';
import 'package:tictactoe/presentation/pages/page_multiplayer/controller/multiplayer_page_controller.dart';
import 'package:tictactoe/presentation/pages/page_multiplayer/multiplayer_page.dart';
import 'package:tictactoe/presentation/pages/page_playai/controller/playai_page_controller.dart';
import 'package:tictactoe/presentation/pages/page_playai/playai_page.dart';
import 'package:tictactoe/presentation/pages/page_register/controller/register_page_controller.dart';
import 'package:tictactoe/presentation/pages/page_register/register_page.dart';
import 'package:tictactoe/presentation/pages/page_selectmode/controller/selectmode_page_controller.dart';
import 'package:tictactoe/presentation/pages/page_selectmode/selectmode_page.dart';
import 'package:tictactoe/presentation/pages/page_welcome/welcome_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String initial = Paths.WELCOME;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(name: Paths.WELCOME, page: () => const WelcomePage(), children: [
      GetPage(
          name: Paths.LOGIN,
          page: () => const LoginPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<LoginPageController>(LoginPageController.new);
          })),
      GetPage(
          name: Paths.REGISTER,
          page: () => const RegisterPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<RegisterPageController>(RegisterPageController.new);
          })),
      GetPage(
          name: Paths.SELECTMODE,
          page: () => const SelectModePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SelectModePageController>(SelectModePageController.new);
          })),
      GetPage(
          name: Paths.HISTORY,
          page: () => const HistoryPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<HistoryPageController>(HistoryPageController.new);
          })),
      GetPage(
          name: Paths.PLAYAI,
          page: () => const PlayAiPlage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<PlayAiPageController>(PlayAiPageController.new);
          })),
      GetPage(
          name: Paths.MULTIPLAYER,
          page: () => const MultiPlayerPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<MultiplayerPageController>(
                MultiplayerPageController.new);
          }))
    ]),
  ];
}
