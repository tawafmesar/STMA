import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:get/get.dart';
import 'package:stma/linkapi.dart';

import '../../controller/explore_controller.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<CarouselItem> itemList = [
    CarouselItem(
      image: const NetworkImage(
        'https://miro.medium.com/max/1400/1*RpaR1pTpRa0PUdNdfv4njA.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
      'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
  ] ;

  @override
  Widget build(BuildContext context) {
    final ExploreControllerImp controller = Get.put(ExploreControllerImp()); // Initialize your controller

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: GetBuilder<ExploreControllerImp>(
          builder: (_) {
            List<CarouselItem> itemList = controller.places.map((place) {
              return CarouselItem(
                image: NetworkImage(
                    place.placeImg != null ? "${AppLink.upload}${place.placeImg}" : 'default_image_path'
                )
                , // Use place image URL
                boxDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                      Colors.blueAccent.withOpacity(1),
                      Colors.black.withOpacity(.3),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
                title: place.placeName ?? '', // Use place name
                titleTextStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                leftSubtitle: place.placesAddress ?? '', // Use place address
                rightSubtitle: 'More info', // You can add more details here
                rightSubtitleTextStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                onImageTap: (i) {
                  // Handle image tap if needed
                },
              );
            }).toList();


            if (itemList.isNotEmpty) {
              return CustomCarouselSlider(
                items: itemList,
                height: 150,
                subHeight: 50,
                width: MediaQuery.of(context).size.width * .9,
                autoplay: true,
              );
            } else {
              return CircularProgressIndicator(); // Or any other placeholder widget
            }


          },
        ),
      ),
    );
  }
}