import 'dart:developer';

import 'package:db_miner/controller/api_controller.dart';
import 'package:db_miner/views/component/img_lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcard/tcard.dart';
import '../../modal/api_modal.dart';

// ignore: must_be_immutable
class SavedDetail extends StatelessWidget {
  SavedDetail({super.key});

  ApiController apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    String quote = ModalRoute.of(context)!.settings.arguments as String;
    List<Widget> card =
        // ignore: invalid_use_of_protected_member
        List.generate(apiController.savedquote.value.length, (index) {
      // ignore: invalid_use_of_protected_member
      ApiModal apiModal = apiController.savedquote.value[index];
      if (apiModal.category == quote) {
        return Container(
          padding: const EdgeInsets.all(3),
          height: s.height * 0.7,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
                image: NetworkImage(
                  img[index % 4],
                ),
                fit: BoxFit.cover),
          ),
          width: double.infinity,
          child: Text(
            apiModal.quote,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        );
      } else {
        return Container(
          height: s.height * 0.7,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.primaries[index % 18],
            image: DecorationImage(
                image: NetworkImage(
                  img[index % 4],
                ),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              apiModal.quote,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(quote),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TCard(
            cards: card,
          ),
        ),
      ),
    );
  }
}
