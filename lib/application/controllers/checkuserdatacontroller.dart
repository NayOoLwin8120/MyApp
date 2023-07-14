// import 'package:get/get.dart';
// import 'package:gettest/application/storage/storageservice.dart';
// import 'package:gettest/home/views/homepage.dart';
// import 'package:gettest/home/views/loginpage.dart';

// class UserInformationController extends GetxController {
//   RxBool isLoggin = false.obs;

//   @override
//   onInit() {
//     getUserLoginData();
//     super.onInit();
//   }

//   Future<void> getUserLoginData() async {
//     final data =
//         await StorageService.readData(key: StorageService.authStoreKey);

//     if (data == null) {
//       isLoggin.value = false;
//       // navigateToMyHomepage();
//     } else {
//       isLoggin.value = true;
//       // navigateToLoginpage();
//     }
//   }

//   navigateToMyHomepage() {
//     Get.offAllNamed(MyHomepage.name);
//   }

//   navigateToLoginpage() {
//     Get.offAllNamed(Loginpage.name);
//   }
// }

import 'package:get/get.dart';
import 'package:gettest/application/storage/storageservice.dart';
import 'package:gettest/home/views/loginpage.dart';
import '../../home/views/homepage.dart';
import 'package:flutter/material.dart';

class UserInformationController extends GetxController {
  RxBool isLoggin = false.obs;

  // Future<void> getUserLoginData() async {
  //   final data =
  //       await StorageService.readData(key: StorageService.authStoreKey);

  //   if (data == null) {
  //     isLoggin.value = false;
  //   } else {
  //     isLoggin.value = true;
  //   }
  // }
  Future<void> getUserLoginData() async {
    final data =
        await StorageService.readData(key: StorageService.authStoreKey);

    if (data == null) {
      isLoggin.value = false;
      Get.offAllNamed(MyHomepage.name);

      debugPrint("==============  ================");
    } else {
      isLoggin.value = true;
      Get.offAllNamed(Loginpage.name);
    }
  }
}
