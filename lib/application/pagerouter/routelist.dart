import 'package:get/get.dart';
import 'package:gettest/home/views/homepage.dart';
import 'package:gettest/home/views/loginpage.dart';

final getRouteList = [
  GetPage(name: MyHomepage.name, page: () => MyHomepage()),
  GetPage(name: Loginpage.name, page: () => Loginpage())
];
