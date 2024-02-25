import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/explore.dart';



class HomeController extends GetxController {
  var currentTabIndex = 0.obs;
  MyServices myServices = Get.find();

  final List<Widget> tabPages = [
    ExploreScreen(),
    Center(child: Text("hellow 2"),),
    Center(child: Text("hellow 3"),),
    Center(child:
    SvgPicture.asset(
      'assets/images/saudi2.svg',
      semanticsLabel: 'My SVG Image',
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
