import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/modal/likedmodal.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikedPage extends StatefulWidget {
  LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  ApiController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getLiked();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: controller.likedquote.value.length,
        itemBuilder: (context, index) {
          // ignore: invalid_use_of_protected_member
          LikeModal likeModal = controller.likedquote.value[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${index + 1}",
                ),
              ),
              title: Text(
                likeModal.FaQuotes,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
