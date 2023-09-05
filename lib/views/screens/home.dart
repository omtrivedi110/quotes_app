import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/utils/path_utils.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:db_miner/views/component/category.dart';
import 'package:db_miner/views/component/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  ApiController controller = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(MyRoutes.likedpage);
            },
            child: const Text("💜"),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(MyRoutes.quotesSaved);
            },
            icon: const Icon(Icons.bookmark),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Quotes"),
            Image.asset(
              imgpath + Paths.logo,
              height: 50,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: PageView(
        onPageChanged: (index) {
          controller.changePage(index2: index);
        },
        controller: controller.pageController,
        children: [
          Home(),
          Category(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (index) {
            controller.changePage(index2: index);
          },
          currentIndex: controller.pageindex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Categories",
            ),
          ],
        );
      }),
    );
  }
}
