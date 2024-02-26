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


final List<String> imgList = [
  'assets/images/num1.jpg',
  'assets/images/num2.jpeg',
  'assets/images/ulaa.jpg'
];

final List<dynamic> _products = [
  {
    'title': 'الركن الأول    الإحرام',
    'image':
    'assets/images/ulaa.jpg',
    'description': 'البدء بنية أداء النسك بالقلب، والتلفظ بها باللسان قائلًا: لبيك اللهم حجًا لحج الإفراد والتمتع (بعد إتمام العمرة) أو اللهم لبيك عمرة وحجًا لحج القران، ولا مانع بإتمامها بأن يقول: فإن حبسني حابس فمحلي حيث حبستني عند الخوف من عدم التمكن من أداء النسك لمرض أو ظرف يوشك أن يُلمّ بك. '
  },
  {
    'title': 'الركن الثاني    الطواف',
    'image':
    'assets/images/num1.jpg',
    'description': 'سبعة أشواط يقوم به ضيف الرحمن حول الكعبة، يبدأ كل شوط من أمام الحجر الأسود وينتهي به، يجعل ضيف الرحمن الكعبة عن يساره أثناء الطواف '
  },
  {
    'title': 'الركن الثالث   السعي',
    'image':
    'assets/images/num2.jpeg',
    'description': 'السعى سبعة أشواط، يبدأ الأول بالصفا وينتهى بالمروة ويبدأ الثانى من المروة وينتهى بالصفا، والشوط السابع ينتهى عند المروة، ويسن الإسراع للرجل دون المرأة بين العمودين الأخضرين، ولا يشترط للسعى طهارة ولا موالاة بين الأشواط فإن كان قد قدّم السعي مع طواف القدوم فلا يعيده. '
  }
];


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

    _controller.addListener(() {
      setState(() {});
    });
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
          ,Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: imageSliders,
              ))],
      ),
    );
  }
}






final List<Widget> imageSliders = _products
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: InkWell(
      onTap: (){
        print('No. ${_products.indexOf(item)} image');

      },
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(_products[1], fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${_products[0]} image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    ),
  ),
))
    .toList();


