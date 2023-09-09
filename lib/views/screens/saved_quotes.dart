import 'dart:developer';
import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:db_miner/utils/back_utils.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Saved_quotes extends StatefulWidget {
  Saved_quotes({super.key});

  @override
  State<Saved_quotes> createState() => _Saved_quotesState();
}

class _Saved_quotesState extends State<Saved_quotes> {
  ApiController apiController = Get.find();

  @override
  void initState() {
    super.initState();
    apiController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Quotes Category"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 3,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              // ignore: invalid_use_of_protected_member
              itemCount: apiController.allcategories.value.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Get.toNamed(MyRoutes.savedDetail,
                    // ignore: invalid_use_of_protected_member
                    arguments: apiController.allcategories.value[index]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [
                        Colors.primaries[index % 18],
                        Colors.primaries[(index + 1) % 18],
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    // ignore: invalid_use_of_protected_member
                    apiController.allcategories.value[index],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
