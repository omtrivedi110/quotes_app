import 'dart:math';
import 'dart:developer' as dev;
import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/controller/tts_controller.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/img_lists.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  ApiController controller = Get.find<ApiController>();

  TTsController tTsController = Get.put(TTsController());

  @override
  Widget build(BuildContext context) {
    Random r1 = Random();
    int a = r1.nextInt(3);
    Size s = MediaQuery.of(context).size;
    ApiModal apiModal = ModalRoute.of(context)!.settings.arguments as ApiModal;
    return Scaffold(
      appBar: AppBar(
        title: Text(apiModal.author),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(
              img[a],
              height: s.height * 0.6,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: s.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Category :- ${apiModal.category}",
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.insertLiked(
                        quotes: apiModal.quote,
                        category: apiModal.category,
                        author: apiModal.author);
                    controller.getLiked();
                  },
                  child: const Text(
                    "♡",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.015,
            ),
            Text(
              apiModal.quote,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      tTsController.speak(text: apiModal.quote);
                    },
                    icon: const Icon(Icons.volume_up_outlined)),
                IconButton(
                    onPressed: () {
                      tTsController.stop();
                    },
                    icon: const Icon(Icons.volume_off_outlined)),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: invalid_use_of_protected_member
          if (controller.allcategories.value.contains(apiModal.category)) {
            Get.snackbar("Already Added", "Can't add Second Time");
          } else {
            controller.allcategories.value.add(apiModal.category);
            dev.log("${controller.allcategories.value.length}");
          }
          controller.insertSaved(
            quotes: apiModal.quote,
            category: apiModal.category,
            author: apiModal.author,
          );
          controller.getData();
        },
        child: const Icon(Icons.bookmark_add_outlined),
      ),
    );
  }
}
