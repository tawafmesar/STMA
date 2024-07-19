import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.width > 600 ? 72.0 : 56.0;


    return Scaffold(
        body: Obx(() => controller.tabPages[controller.currentTabIndex.value]),
        bottomNavigationBar: ConvexAppBar(
          color: AppColor.primaryColor,
          elevation: 10,
          backgroundColor: AppColor.primaryColor,
          height:appBarHeight ,
          style: TabStyle.react,
          top: -25,
          curveSize: 100,



          items:  [
            TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.ccDiscover,color: AppColor.whitee,))
                , title: 'Explore'),
            TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.paperPlane,color: AppColor.whitee,))
                , title: 'Plan'),
            TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.cameraRetro,color: AppColor.whitee,)), title: 'Travel Tips'),
            TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.user,color: AppColor.whitee,)), title: 'Profile'),
          ],
          onTap: (int i) { controller.changeTabIndex(i);},
        )
    );
  }
}
