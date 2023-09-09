import 'package:db_miner/controller/login_controller.dart';
import 'package:db_miner/utils/route_utils.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyLoginPage extends StatelessWidget {
  MyLoginPage({super.key});

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello world"),
      ),
      // body: FlutterLogin(
      //   onLogin: (val) {
      //     Get.toNamed(
      //       MyRoutes.home,
      //     );
      //   },
      //   onRecoverPassword: (val) {},
      // ),
    );
  }
}
