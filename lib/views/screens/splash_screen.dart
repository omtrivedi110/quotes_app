import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:db_miner/utils/path_utils.dart';
import 'package:db_miner/views/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: 800,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              SizedBox(
                height: 300,
                child: AnimatedSplashScreen(
                  splash: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(imgpath + Paths.logo),
                  ),
                  nextScreen: HomePage(),
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
      ),
    );
  }
}
