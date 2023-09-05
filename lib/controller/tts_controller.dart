import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class TTsController extends GetxController {
  FlutterTts flutterTts = FlutterTts();

  speak({required String text}) {
    flutterTts.setLanguage("en-us");
    flutterTts.setPitch(1);
    flutterTts.speak(text);
  }

  stop() {
    flutterTts.stop();
  }
}
