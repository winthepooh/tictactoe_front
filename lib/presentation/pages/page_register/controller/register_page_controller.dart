import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tictactoe/domain/model/user/user_model.dart';
import 'package:tictactoe/domain/repositories/user/user_repository.dart';
import 'package:tictactoe/presentation/routes/app_pages.dart';
import 'package:tictactoe/services/stores/tic_store.dart';

class RegisterPageController extends GetxController {
  TextEditingController usernameTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();
  TextEditingController confirmPasswordTextField = TextEditingController();

  void clickRegister() async {
    if ((usernameTextField.text.trim() != "" ||
            passwordTextField.text.trim() != "" ||
            confirmPasswordTextField.text.trim() != "") &&
        passwordTextField.text == confirmPasswordTextField.text) {
      bool status = await GetIt.I<UserRepository>().register({
        "username": usernameTextField.text,
        "password": passwordTextField.text
      });
      if (status) {
        UserModel? user = await GetIt.I<UserRepository>()
            .login(usernameTextField.text, passwordTextField.text);
        GetIt.I<TicStore>().setUser(user!);
        EasyLoading.showInfo("Succesfully! registered.");
        Get.toNamed(Paths.SELECTMODE);
      } else {
        EasyLoading.showError("Error! registering.");
      }
    } else {
      EasyLoading.showError("Invalid input!");
    }
  }

  void clickBack() {
    Get.back();
  }
}
