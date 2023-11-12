import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tictactoe/domain/model/user/user_model.dart';
import 'package:tictactoe/domain/repositories/user/user_repository.dart';
import 'package:tictactoe/presentation/routes/app_pages.dart';
import 'package:tictactoe/services/stores/tic_store.dart';

class LoginPageController extends GetxController {
  TextEditingController usernameTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();

  void clickLogin() async {
    if (usernameTextField.text.trim() == "" ||
        passwordTextField.text.trim() == "") {
      EasyLoading.showError("Some of the fields are empty!");
      return;
    }
    UserModel? user = await GetIt.I<UserRepository>()
        .login(usernameTextField.text, passwordTextField.text);
    if (user == null) {
      EasyLoading.showError("Incorrect username or password!");
    } else {
      EasyLoading.showInfo("Login as user: ${user.username!}");
      GetIt.I<TicStore>().setUser(user);
      Get.toNamed(Paths.SELECTMODE);
    }
  }

  void clickRegister() {
    Get.toNamed(Paths.REGISTER);
  }
}
