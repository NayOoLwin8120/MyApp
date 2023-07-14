import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gettest/application/initialbinding.dart';
import 'package:gettest/application/pagerouter/routelist.dart';
import 'package:gettest/home/views/slide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: getRouteList,
      initialBinding: InitDep(),
      // home: MyHomepage(),
      home: IntroScreenDefault(),
    );
  }
}
