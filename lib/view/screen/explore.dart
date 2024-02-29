import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../controller/explore_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';



class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {


  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/home.mp4');


    _controller.setLooping(true);
    _controller.play();
    _controller.initialize().then((_) => setState(() {}));
    // _controller.play();
    _controller.setVolume(0.0);

  }

  @override
  Widget build(BuildContext context) {

    final contrllerr = Get.put(ExploreControllerImp());
    Get.put(ExploreControllerImp());

    int _current = 0;
    dynamic _selectedIndex = {};

    final CarouselController _carouselController = CarouselController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.splsh,
        elevation: 6,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AppImageAsset.openaiLogo),
        ),
        title: const Text("Smart Assistant",style: TextStyle(color: AppColor.primaryColor),),
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),

        children:[

          Column(children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                    alignment: FractionalOffset.bottomRight +
                        const FractionalOffset(-0.1, -0.1),
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio ?? 16 / 9,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              VideoPlayer(_controller),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ]),
          Text(
            " Explore Saudi Arabia's",
            style: TextStyle(fontSize: 38.0),
          ),
          SizedBox(
            height: 80,
            width: 250.0,
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.splsh
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    ScaleAnimatedText('ancient heritage and culture'),
                    ScaleAnimatedText('breathtaking outdoor activities'),
                    ScaleAnimatedText('delicious local food'),
                  ],
                    repeatForever:true

                ),
              ),
            ),
          ),
          SizedBox(
            width: 250.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Agne',
                  color:Colors.black
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Plan your trip in Saudi today!'),
                  ],
                    repeatForever:true

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}




