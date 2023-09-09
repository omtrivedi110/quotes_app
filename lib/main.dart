import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/controller/storagecontroller.dart';
import 'package:db_miner/helpers/db_helper.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:db_miner/views/screens/detail_page.dart';
import 'package:db_miner/views/screens/home.dart';
import 'package:db_miner/views/screens/likedpage.dart';
import 'package:db_miner/views/screens/savedDetail.dart';
import 'package:db_miner/views/screens/saved_quotes.dart';
import 'package:db_miner/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.initDB();
  ApiController controller = Get.put(ApiController());
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  StorageController storageController = Get.put(StorageController());
  // storageController.setOne();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  StorageController controller = Get.find<StorageController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: controller.isone ? MyRoutes.home : MyRoutes.splash,
      getPages: [
        GetPage(name: MyRoutes.home, page: () => HomePage()),
        GetPage(name: MyRoutes.splash, page: () => SplashScreen()),
        GetPage(name: MyRoutes.detail, page: () => DetailPage()),
        GetPage(name: MyRoutes.quotesSaved, page: () => Saved_quotes()),
        GetPage(name: MyRoutes.likedpage, page: () => LikedPage()),
        GetPage(name: MyRoutes.savedDetail, page: () => SavedDetail()),
      ],
    );
  }
}
