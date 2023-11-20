import 'package:get/get.dart';
import 'package:tictactoe/presentation/routes/app_pages.dart';

class SelectModePageController extends GetxController {
  void clickMultiPlayer() {}

  void clickSinglePlayer() {
    Get.toNamed(Paths.PLAYAI);
  }

  void clickHistory() async {
    Get.toNamed(Paths.HISTORY);
  }
}
