import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/hotels_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../data/models/Hotels_model.dart';
import '../../linkapi.dart';
import '../widget/hotelscard.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late hotels_model hotelsmodel;

    Get.put(HotelsControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Handle back button press
        ),
        title: Text("Hotels",
            style:TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: AppColor.clockBG,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],)),
      ),
      body: GetBuilder<HotelsControllerImp>(builder: ((controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView(
          children: [

            ...List.generate(
                controller.hotel.length,
                    (index) => InkWell(
                      child: Container(
                  margin:  EdgeInsets.all(10), // Add margin as needed
                  child: Material(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.primaryColor, // Border color
                          width: 3.0, // Border width
                        ),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)), // Border radius
                      ),
                      child: HotelsCard(
                        title: "${controller.hotel[index].hotelName}",
                        desc: "${controller.hotel[index].hotelAddress}",
                        image: AppImageAsset.pattern1
                        ,
                        hotelimage: "${AppLink.upload}${controller.hotel[index].hotelImage}",
                      ) ,
                  ),
                ),
                      onTap: (){
                        hotelsmodel = controller.hotel[index] ;
                        controller.goToPageProductDetails(index);
                      },
                    )
            )
          ],
        )
    )
    ))
    );
  }
}
