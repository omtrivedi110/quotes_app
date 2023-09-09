import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final RxString _login = "".obs;
  final RxString _pass = "".obs;
  GetStorage storage = GetStorage();

  setLogin({required String login, required String pass}) {
    storage.write(_login.value, login);
    storage.write(_pass.value, pass);
  }

  get getloginId {
    return storage.read(_login.value);
  }

  get getPass {
    return storage.read(_pass.value);
  }
}
