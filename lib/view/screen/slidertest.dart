import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:we_slide/we_slide.dart';

import '../../controller/placedetails_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../data/models/placeimage_model.dart';



class TestScren extends StatelessWidget {
  const TestScren({super.key});

  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
    'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
    'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
    'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
    'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
    'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  ];

  @override
  Widget build(BuildContext context) {

    final _colorScheme = Theme.of(context).colorScheme;
    final double _panelMinSize = 70.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      backgroundColor: Colors.black,
      body: WeSlide(
        panelMinSize: _panelMinSize,
        panelMaxSize: _panelMaxSize,
        body: Container(
          height: 75,
          margin: const EdgeInsets.all(10),
          child: Material(
            elevation: 10,
            shape:const RoundedRectangleBorder(
              side:  BorderSide(
                color: AppColor.cardColor, // Border color
                width: 3.0, // Border width
              ),
              borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)), // Border radius
            ),
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius:const BorderRadius.only(
                      topLeft: Radius.circular(25)),
                  color: AppColor.primaryTextColor,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child:     Image.asset(
                          AppImageAsset.pattern1,
                          fit: BoxFit.cover,
                          height: 30,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColor.clockOutline,

                  child: Center(
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "adf hda sjh text",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColor.splsh,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColor.clockOutline,
                  child: Row(
                    children: [
                      Container(
                        width: 130, // Set your desired width
                        height: 160, // Set your desired height
                        child: Image.asset(
                          'assets/images/ulaa.jpg' ,
                        ),
                      ),
                      // Second column with text
                      const Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'adsdasda dasdhasd asdioihasdja dkjasdkjas ddakjsdkjasd'
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

              ],
            ),
          ),
        ),
        panel: Container(
          color: _colorScheme.primary,
          child: Center(child: Text("This is the panel 😊")),
        ),
        panelHeader: Container(
          height: _panelMinSize,
          color: _colorScheme.secondary,
          child: Center(child: Text("Slide to Up ☝️")),
        ),
      ),
    );
  }
}
