import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/modal/api_modal.dart';
import 'package:db_miner/modal/likedmodal.dart';
import 'package:db_miner/utils/back_utils.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcard/tcard.dart';

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
    Size s = MediaQuery.of(context).size;
    List<Widget> card =
        List.generate(controller.likedquote.value.length, (index) {
      LikeModal likeModal = controller.likedquote.value[index];

      return Container(
        padding: const EdgeInsets.all(35),
        height: s.height * 0.7,
        alignment: const Alignment(0, -0.7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://e0.pxfuel.com/wallpapers/834/213/desktop-wallpaper-premium-psd-of-blank-plain-white-paper-template-with-fountain-pen-paper-template-white-paper-background-for-quotes.jpg"),
              fit: BoxFit.cover),
        ),
        width: double.infinity,
        child: Text(
          likeModal.FaQuotes,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        ),
      );
    });
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://i.pinimg.com/236x/22/f3/0c/22f30c1c06c893fe0ab014fb2d8dc14a.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: (controller.likedquote.value.isNotEmpty)
                ? TCard(cards: card)
                : const Text("You have Not Liked Anything Yet !.."),
          ),
        ],
      ),
    );
  }
}
