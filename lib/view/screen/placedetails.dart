import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

import '../../controller/placedetails_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../linkapi.dart';
import '../widget/title.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    PlaceDetailsControllerImp controller =
    Get.put(PlaceDetailsControllerImp());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            iconTheme:IconThemeData(

              color: Colors.cyan
            ),
            pinned: true,
            backgroundColor: AppColor.primaryColor,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("${controller.placesmodel.placeName}",
                  style: TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: AppColor.clockBG,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],)
              ),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      controller.placesmodel.placeImg != null
                          ? "${AppLink.upload}${controller.placesmodel.placeImg}"
                          : 'default_image_path',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    TitleMain(text: "About", image: AppImageAsset.pattern1),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      margin:const EdgeInsets.only(right: 12),
                      child:  Text("${controller.placesmodel.placeAbout}",
                          style: const TextStyle(color:AppColor.bottombar,
                            fontSize: 20, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: AppColor.cardColor,
                                offset: Offset(2, 2), // Set the shadow offset
                                blurRadius: 4, // Set the shadow blur radius
                              ),
                            ],)
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleMain(text: "Gallery", image: AppImageAsset.pattern1),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          GetBuilder<PlaceDetailsControllerImp>(
                            builder: (controller) {

                              if(controller.sampleImages.isNotEmpty){
                                return FanCarouselImageSlider(
                                  imagesLink:  controller.sampleImages,
                                  isAssets: false,
                                  autoPlay: true,

                                    expandedImageFitMode:BoxFit.contain

                                );
                              }else{
                                return const Center(
                                    child:
                                    CircularProgressIndicator());

                              }
                            },
                          )
                          ,
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Container(
                        color: AppColor.clockOutline,
                        margin: EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 100, // Set your desired width
                              height: 120, // Set your desired height
                              child: Image.network(
                                '${AppLink.upload}${controller.placesmodel.placeImg}' ,
                              ),
                            ),
                            // Second column with text
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Address : ${controller.placesmodel.placeName}${controller.placesmodel.placesAddress}'
                                  ,
                                  style: TextStyle(
                                    color: AppColor.bottombar, // Text color
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 12.0,
                    ),


                    NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: () {
                        controller.gotohotels();

                      },
                      decoration: const NeoPopTiltedButtonDecoration(
                        color: Color.fromRGBO(122, 0, 89 , 1),
                        plunkColor: Color.fromRGBO(158, 52, 129, 1),
                        shadowColor: Color.fromRGBO(206, 206, 206, 1),
                        showShimmer: true,
                      ),
                      child:  Padding(
                        padding:const EdgeInsets.symmetric(
                          horizontal: 70.0,
                          vertical: 15,
                        ),
                        child: Expanded(
                            child: Text(
                                'Hotels of ${controller.placesmodel.placeName}'
                            ,style: TextStyle(color: AppColor.whitee,
                              fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 12.0,
                    ),


                    NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: () {
                        controller.gotovotesSuggestions();

                      },
                      decoration: const NeoPopTiltedButtonDecoration(
                        color: Color.fromRGBO(122, 0, 89 , 1),
                        plunkColor: Color.fromRGBO(158, 52, 129, 1),
                        shadowColor: Color.fromRGBO(206, 206, 206, 1),
                        showShimmer: true,
                      ),
                      child:  Padding(
                        padding:const EdgeInsets.symmetric(
                          horizontal: 70.0,
                          vertical: 15,
                        ),
                        child: Expanded(
                            child: Text(
                              'Voites and Suggestions'
                              ,style: TextStyle(color: AppColor.whitee,
                                fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 12.0,
                    ),

                  ],
                );
              },
              childCount: 1,
            ),
          ) ,
        ],
      ),
    );
  }
}
