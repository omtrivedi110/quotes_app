import 'dart:developer';
import 'package:db_miner/helpers/api_helper.dart';
import 'package:db_miner/helpers/db_helper.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:db_miner/modal/likedmodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  RxList<ApiModal> quote = <ApiModal>[].obs;

  RxInt index = (-1).obs;

  RxList<String> allcategories = <String>[].obs;

  RxList<ApiModal> savedquote = <ApiModal>[].obs;

  RxList<LikeModal> likedquote = <LikeModal>[].obs;

  PageController pageController = PageController();

  RxInt pageindex = 0.obs;

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

  changePage({required int index2}) {
    pageController.animateToPage(index2,
        duration: const Duration(milliseconds: 600), curve: Curves.ease);
    pageindex(index2);
  }

  insertSaved(
      {required String quotes,
      required String category,
      required String author}) async {
    await DBHelper.dbHelper
        .insertQuotes(quotes: quotes, category: category, author: author);
    Get.snackbar("Done !!", "Affected");
    getData();
  }

  insertLiked(
      {required String quotes,
      required String category,
      required String author}) async {
    await DBHelper.dbHelper
        .addliked(quotes: quotes, category: category, author: author);

    Get.snackbar("Updated", "Liked !!");
  }

  getLiked() async {
    likedquote(await DBHelper.dbHelper.displayLiked());
  }

  getData() async {
    savedquote(await DBHelper.dbHelper.displayQuotes());
  }

  getApi() async {
    quote.value = (await ApiHelper.apiHelper.getApi())!;
  }

  getByCategory({required String category}) async {
    quote(
      await ApiHelper.apiHelper.byCategory(category: category),
    );
  }
}
