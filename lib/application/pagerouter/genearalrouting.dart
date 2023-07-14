import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gettest/home/views/homepage.dart';

GetPageRoute? generalrouting(RouteSettings settings) {
  switch (settings.name) {
    case MyHomepage.name:
      return GetPageRoute(
        settings: settings,
        page: () =>  MyHomepage(),
      );
  }
  return null;
}
