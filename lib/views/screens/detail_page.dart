import 'dart:math';

import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/img_lists.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  ApiController controller = Get.find();

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
              height: s.height * 0.03,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Category :- ${apiModal.category}",
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Text(
              apiModal.quote,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   onPressed: () {},
          //   child: const Text(
          //     "❣️",
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              controller.insertSaved(
                  quotes: apiModal.quote,
                  category: apiModal.category,
                  author: apiModal.author);
            },
            child: const Icon(Icons.bookmark_add_outlined),
          ),
        ],
      ),
    );
  }
}
