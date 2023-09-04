import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Saved_quotes extends StatelessWidget {
  Saved_quotes({super.key});

  ApiController apiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Quotes"),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
            // ignore: invalid_use_of_protected_member
            itemCount: apiController.savedquote.value.length,
            itemBuilder: (context, index) {
              // ignore: invalid_use_of_protected_member
              ApiModal apiModal = apiController.savedquote.value[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      "${index + 1}",
                    ),
                  ),
                  title: Text(
                    apiModal.quote,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            });
      }),
    );
  }
}
