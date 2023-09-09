import 'dart:convert';
import 'dart:developer';
import 'package:db_miner/modal/api_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  List<ApiModal> quotes = [];
  final String api = "https://api.api-ninjas.com/v1/quotes?limit=15";

  Future<List<ApiModal>?> getApi() async {
    http.Response response = await http.get(Uri.parse(api),
        headers: {'x-Api-Key': 'raqL8B7sZLldrZeckkzd7Q==a3XGgTXZm7QvE4vj'});

    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      List tmpquote = jsonDecode(response.body);
      quotes = tmpquote.map((e) => ApiModal.fromApi(data: e)).toList();
      return quotes;
    } else {
      return null;
    }
  }

  Future<List<ApiModal>?> byCategory({required String category}) async {
    final String api =
        "https://api.api-ninjas.com/v1/quotes?limit=20&category=$category";

    http.Response response = await http.get(Uri.parse(api),
        headers: {'x-Api-Key': 'raqL8B7sZLldrZeckkzd7Q==a3XGgTXZm7QvE4vj'});

    if (response.statusCode == 200) {
      List tmpquote = jsonDecode(response.body);
      quotes = tmpquote.map((e) => ApiModal.fromApi(data: e)).toList();
      return quotes;
    } else {
      return null;
    }
  }
}
