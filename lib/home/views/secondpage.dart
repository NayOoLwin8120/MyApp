import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gettest/home/controllers/webview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondPage extends StatelessWidget {
  final WebviewController _controller = Get.put(WebviewController());

  SecondPage({super.key});

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
          Get.isDarkMode ? 'Second Page' : 'Second Page',
          style: TextStyle(color: Get.isDarkMode ? Colors.red : Colors.black),
        ),
        leading: UnconstrainedBox(
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: AbsorbPointer(
              child: Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  // color: Get.theme.colorScheme.primary,
                  color: const Color(0xff50A6B2).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                      blurRadius: 6,
                      color: Color.fromARGB(34, 0, 0, 0),
                    )
                  ],
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
      ),
      // body: WebViewWidget(controller: _controller.controller),
      body: Obx(
        () => Column(
          children: [
            if (_controller.prgres.value)
              LinearProgressIndicator(
                value: _controller.progressValue.value,
                color: Colors.blue, // Set your desired progress color
                backgroundColor: Colors.grey, // Set the background color
              ),
            Expanded(
              child: WebViewWidget(controller: _controller.controller),
            ),
          ],
        ),
      ),
    );
  }
}
