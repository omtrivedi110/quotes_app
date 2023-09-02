import 'dart:developer';

import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:db_miner/utils/path_utils.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {}, child: const Text("💜")),
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
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.getByCategory(
                          category: controller.categories[index]);
                    },
                    child: Text(
                      controller.categories[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  // ignore: invalid_use_of_protected_member
                  itemCount: controller.quote.value.length,
                  itemBuilder: (context, index) {
                    // ignore: invalid_use_of_protected_member
                    ApiModal apimodal = controller.quote.value[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(MyRoutes.detail, arguments: apimodal);
                        },
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(
                          apimodal.quote,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
