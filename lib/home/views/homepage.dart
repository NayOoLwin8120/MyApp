import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:gettest/home/controllers/homepagecontroller.dart';
import 'package:gettest/home/views/secondpage.dart';
import 'package:in_app_review/in_app_review.dart';

// ignore: must_be_immutable
class MyHomepage extends GetView<MyhomepageContoller> {
  static const String name = '/home';
  @override
  MyhomepageContoller cont = Get.put(MyhomepageContoller());
  MyHomepage({super.key});
  final FlutterTts tts = FlutterTts();
  final TextEditingController controllers =
      TextEditingController(text: 'Hello world');

  Home() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Get.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        // title: const Text("Homepage"),
        title: Text(
          Get.isDarkMode ? 'Dark Theme' : 'Light Theme',
          style: TextStyle(color: Get.isDarkMode ? Colors.red : Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  'clicks: ${controller.count}',
                )),
            Obx(() {
              if (controller.android.value) {
                return Text(
                    "You are usng Android and Your height is ${Get.height} and Your width is ${Get.width}, Your device id is ${DeviceInfoPlugin().deviceInfo},Data : ${controller.text}");
              } else {
                return const Text("You are using Mobile");
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  if (controller.show.value) {
                    return TextButton(
                        onPressed: () {
                          controller.increase_count();
                        },
                        child: const Text("Increase + "));
                  } else {
                    return const Text("NUll");
                  }
                }),
                TextButton(
                    onPressed: () {
                      controller.check();
                    },
                    child: const Text("Check ")),

                // TextButton(
                //     onPressed: () {
                //       controller.increase_count();
                //     },
                //     child: const Text("Increase + ")),
                TextButton(
                    onPressed: () {
                      controller.decrease_count();
                    },
                    child: const Text("Decrease - ")),
              ],
            ),
            TextFormField(
              controller: controller.gettext,
            ),
            TextButton(
                onPressed: () {
                  print(controller.gettext);
                  controller.storedata();
                  controller.readdata();
                },
                child: const Text("Search")),
            TextFormField(
              controller: controllers,
            ),
            TextButton(
                onPressed: () {
                  tts.speak(controllers.text);
                },
                child: const Text("Speak")),
            TextButton(
                onPressed: () {
                  controller.showbottom();
                },
                child: const Text("Show Bottom")),
            OutlinedButton(
              onPressed: () {
                Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              },
              child: const Text('Change Theme'),
            ),
            OutlinedButton(
              onPressed: () {
                controller.getDeviceUniqueId();
              },
              child: const Text('Device info'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.to(SecondPage());
              },
              child: const Text('Second Page'),
            ),
            ElevatedButton(
              onPressed: () async {
                final InAppReview inAppReview = InAppReview.instance;

                if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                }
              },
              child: const Text('Open App Review'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/bunny.gif'),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                )
              ],
              accountEmail: const Text('dev.yakkuza@gmail.com'),
              accountName: const Text('Dev Yakuza'),
              onDetailsPressed: () {
                print('press details');
              },
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
