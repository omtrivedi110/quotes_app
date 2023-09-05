import 'package:db_miner/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  Category({super.key});

  ApiController controller = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        itemCount: controller.categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Obx(
            () {
              return GestureDetector(
                onTap: () {
                  controller.index.value = index;
                  controller.getByCategory(
                    category: controller.categories[index],
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (controller.index.value == index)
                            ? Colors.black
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(40),
                    gradient: (controller.index.value == index)
                        ? null
                        : LinearGradient(
                            colors: [
                              Colors.primaries[index % 18],
                              Colors.primaries[(index + 1) % 18],
                            ],
                          ),
                  ),
                  child: Text(
                    controller.categories[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
