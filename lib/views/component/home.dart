import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  ApiController controller = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  controller.getByCategory(
                    category: val,
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                // ignore: invalid_use_of_protected_member
                itemCount: controller.quote.value.length,
                itemBuilder: (context, index) {
                  // ignore: invalid_use_of_protected_member
                  ApiModal apimodal = controller.quote.value[index];
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.primaries[index % 18],
                          Colors.primaries[(index + 1) % 18],
                        ],
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(MyRoutes.detail, arguments: apimodal);
                      },
                      title: Text(
                        apimodal.quote,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
