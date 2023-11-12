import 'package:tictactoe/domain/model/user/user_model.dart';

class TicStore {
  UserModel _userStore = UserModel();

  void setUser(UserModel user) {
    _userStore = user;
  }

  UserModel getUser() {
    return _userStore;
  }
}
