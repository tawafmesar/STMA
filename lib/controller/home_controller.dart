import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/explore.dart';
import '../view/screen/placedetails.dart';
import '../view/screen/slidertest.dart';
import '../view/screen/test.dart';



class HomeController extends GetxController {
  var currentTabIndex = 0.obs;
  MyServices myServices = Get.find();

  final List<Widget> tabPages = [
    ExploreScreen(),
    Center(child:
    Image.asset(
      'assets/images/logo.png',
      height: 100,
      width: 70,
    ),),
    Center(child:
    Image.asset(
      'assets/images/logo.png',
      height: 100,
      width: 70,
    ),),
    Center(child:
    Image.asset(
      'assets/images/logo.png',
      height: 100,
      width: 70,
    ),),
  ];


  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }

  @override
  logout() async {

    myServices.sharedPreferences.setString("step","1") ;
    await Future.delayed(Duration.zero);
    Get.offNamed(AppRoute.login);
  }
}
