import 'package:db_miner/helpers/api_helper.dart';
import 'package:db_miner/helpers/db_helper.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  RxList<ApiModal> quote = <ApiModal>[].obs;
  RxList<ApiModal> savedquote = <ApiModal>[].obs;

  List<String> categories = [
    "love",
    "alone",
    "good",
    "dreams",
    "great",
    "humor",
    "happiness",
    "dreams",
    "experience",
    "cool",
    "knowledge",
    "health"
  ];

  ApiController() {
    getApi();
  }

  insertSaved(
      {required String quotes,
      required String category,
      required String author}) async {
    int a = await DBHelper.dbHelper
        .insertQuotes(quotes: quotes, category: category, author: author);
    (a == 1)
        ? Get.snackbar("Done !!", "Affected")
        : Get.snackbar("Something went wrong", "sorry for that 😔");
    getData();
  }

  getData() async {
    savedquote(await DBHelper.dbHelper.displayQuotes());
  }

  getApi() async {
    quote.value = (await ApiHelper.apiHelper.getApi())!;
  }

  getByCategory({required String category}) async {
    quote(await ApiHelper.apiHelper.byCategory(category: category));
  }
}
