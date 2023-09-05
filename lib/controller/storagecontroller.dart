import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageController extends GetxController {
  final String _isfirst = "isfirst";
  SharedPreferences? preferences;

  StorageController({required SharedPreferences pref}) {
    preferences = pref;
  }

  GetStorage storage = GetStorage();

  bool get isone {
    return preferences!.getBool(_isfirst) ?? false;
  }

  setOne() {
    preferences!.setBool(_isfirst, true);
    // storage.write(_isfirst, true);
    // log(storage.read(_isfirst).toString());
  }
}
