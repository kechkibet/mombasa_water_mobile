import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }


}