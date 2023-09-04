import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/helpers/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikedPage extends StatelessWidget {
  LikedPage({super.key});

  ApiController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Liked Page"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: controller.likedquote.value.length,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text(""),
              );
            }));
  }
}
