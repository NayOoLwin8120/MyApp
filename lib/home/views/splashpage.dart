// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gettest/application/controllers/checkuserdatacontroller.dart';

// class SplashPage extends GetView<UserInformationController> {
//   final UserInformationController _controller = Get.find();

//   SplashPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: _controller.isLoggin.value
//           ? _controller.navigateToMyHomepage()
//           : _controller.navigateToLoginpage(),
//     );
//   }
// }

// class ScrollLoading {
//   static Widget scrollLoading() {
//     return const Center(
//       child: CircularProgressIndicator(
//         color: Colors.blue,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gettest/application/controllers/checkuserdatacontroller.dart';

// class SplashPage extends StatelessWidget {
//   final UserInformationController _controller = Get.find();

//   SplashPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _controller.getUserLoginData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return ScrollLoading.scrollLoading();
//           } else {
//             Future.delayed(Duration.zero, () {
//               if (_controller.isLoggin.value) {
//                 Get.offAllNamed(MyHomepage.name);
//               } else {
//                 Get.offAllNamed(Loginpage.name);
//               }
//             });

//             // Return an empty container as a placeholder
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }

class SplashPage extends StatelessWidget {
  final UserInformationController _controller = Get.find();

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _controller.getUserLoginData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ScrollLoading.scrollLoading();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ScrollLoading {
  static Widget scrollLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  }
}
