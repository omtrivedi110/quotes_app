import 'dart:math';
import 'package:db_miner/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcard/tcard.dart';
import '../../modal/api_modal.dart';
import '../component/img_lists.dart';

class SavedDetail extends StatelessWidget {
  SavedDetail({super.key});

  ApiController apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    Random r1 = Random();
    Size s = MediaQuery.of(context).size;
    int a = r1.nextInt(3);
    String quote = ModalRoute.of(context)!.settings.arguments as String;
    List<Widget> card =
        List.generate(apiController.savedquote.value.length, (index) {
      ApiModal apiModal = apiController.savedquote.value[index];
      if (apiModal.category == quote) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              img[index % 4],
              height: s.height * 0.6,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              apiModal.quote,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(quote),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TCard(cards: card),
      ),
    );
  }
}
