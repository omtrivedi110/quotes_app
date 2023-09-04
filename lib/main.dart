import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/helpers/db_helper.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:db_miner/views/screens/detail_page.dart';
import 'package:db_miner/views/screens/home.dart';
import 'package:db_miner/views/screens/likedpage.dart';
import 'package:db_miner/views/screens/saved_quotes.dart';
import 'package:db_miner/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper.dbHelper.initDB();
  ApiController controller = Get.put(ApiController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splash,
      // ApiController api = Get.put(ApiController()),
      getPages: [
        GetPage(name: MyRoutes.home, page: () => HomePage()),
        GetPage(name: MyRoutes.splash, page: () => SplashScreen()),
        GetPage(name: MyRoutes.detail, page: () => DetailPage()),
        GetPage(name: MyRoutes.quotesSaved, page: () => Saved_quotes()),
        GetPage(name: MyRoutes.likedpage, page: () => LikedPage()),
      ],
    );
  }
}
