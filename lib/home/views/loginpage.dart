import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gettest/home/controllers/homepagecontroller.dart';

// ignore: must_be_immutable
class Loginpage extends GetView<MyhomepageContoller> {
  static const String name = '/login';
  @override
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Get.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          Get.isDarkMode ? 'Dark Theme' : 'Light Theme',
          style: TextStyle(color: Get.isDarkMode ? Colors.red : Colors.black),
        ),
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'This is login page',
          ),
        ]),
      ),
    );
  }
}
