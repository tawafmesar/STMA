import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stma/core/constant/imageasset.dart';

import '../../../controller/home_controller.dart';
class LogoutScreen extends StatefulWidget {
  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    controller.logout();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image.asset(AppImageAsset.logo),
      ),
    );
  }
}
