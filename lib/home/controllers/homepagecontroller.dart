import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:gettest/home/customwidgets/bottomsheets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyhomepageContoller extends GetxController {
  RxInt count = 0.obs;
  RxBool show = true.obs;
  RxBool android = false.obs;
  TextEditingController gettext = TextEditingController();
  var deviceInfo = DeviceInfoPlugin();
  var deviceIdentifier = 'unknown';
  RxString text = ''.obs;
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller =
      TextEditingController(text: 'Hello world');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void increase_count() {
    show.value = true;
    count.value++;

    if (count.value > 10) {
      show.value = false;
      Get.snackbar("Warning!", "You cannot increase more than 10",
          backgroundColor: Colors.red);
      count.value = 0;
    }
  }

  void decrease_count() {
    count.value--;
    if (count.value < 0) {
      Get.snackbar("Warning!", "You cannot decrease less than 0",
          backgroundColor: Colors.red);
      count.value = 0;
    }
  }

  void check() {
    if (GetPlatform.isAndroid) {
      android.value = true;
    } else {
      android.value = false;
    }
  }

  // bottom sheets
  void showbottom() {
    openBottomSheet();
  }

  void storedata() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("gettexts", gettext.text.toString());
  }

  void readdata() async {
    final prefs = await SharedPreferences.getInstance();
    text.value = prefs.getString("gettexts").toString();
  }

  Future<String> getDeviceUniqueId() async {
    var deviceIdentifier = 'unknown';
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.id;
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor!;
    } else if (Platform.isLinux) {
      var linuxInfo = await deviceInfo.linuxInfo;
      deviceIdentifier = linuxInfo.machineId!;
    } else if (kIsWeb) {
      var webInfo = await deviceInfo.webBrowserInfo;
      deviceIdentifier = webInfo.vendor! +
          webInfo.userAgent! +
          webInfo.hardwareConcurrency.toString();
    }

    return deviceIdentifier;
  }

  /// Text to Speach
  void home() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
    
  }
}
