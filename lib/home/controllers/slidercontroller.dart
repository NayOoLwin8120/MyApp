import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gettest/gen/assets.gen.dart';
import 'package:intro_slider/intro_slider.dart';

class SliderController extends GetxController {
  PageController controller = PageController();
  List<ContentConfig> listContentConfig = [];
  RxBool showSkipButton = true.obs;
  RxInt countdownDuration = 7.obs;
  RxInt countdown = 7.obs;
  final messages = ["First Screen", "Second Screen", "Third Screen"];
  final images = [
    Assets.images.sliderOne.path,
    Assets.images.sliderTwo.path,
    Assets.images.sliderThree.path,
  ];
  RxInt numberOfPages = 3.obs;
  RxInt currentPage = 0.obs;
  Timer? autoscrollTimer;

  @override
  void onInit() {
    addingvalue();
    startAutoScrollTimer();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    autoscrollTimer?.cancel(); // TODO: implement onClose
    super.onClose();
  }

  void addingvalue() {
    listContentConfig.add(
      const ContentConfig(
        title: "ERASER",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited Allow miles wound place the leave had. To sitting subject no improve studied limitedAllow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/slider_one.jpeg",
        heightImage: 370,
        widthImage: 400,
        backgroundColor: Color.fromARGB(255, 197, 175, 209),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "PENCIL",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        pathImage: "assets/images/slider_two.jpeg",
        backgroundColor: Color.fromARGB(255, 197, 175, 209),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "RULER",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "assets/images/slider_three.jpeg",
        backgroundColor: Color.fromARGB(255, 197, 175, 209),
      ),
    );
  }

  void startAutoScrollTimer() {
    autoscrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentPage.value < listContentConfig.length - 1) {
        currentPage.value++;
        controller.animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel(); // Stop auto-scrolling after reaching the last page
      }
    });
  }
}
