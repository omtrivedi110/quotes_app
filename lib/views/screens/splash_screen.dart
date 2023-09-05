import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:db_miner/controller/storagecontroller.dart';
import 'package:db_miner/utils/path_utils.dart';
import 'package:db_miner/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  StorageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: s.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: s.height * 0.5,
              child: AnimatedSplashScreen(
                splash: Transform.scale(
                  scale: 1.5,
                  child: Image.asset(imgpath + Paths.logo),
                ),
                nextScreen: controller.isone ? HomePage() : SplashScreen(),
                duration: 3000,
              ),
            ),
            const Text(
              "Welcome To Quote App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
