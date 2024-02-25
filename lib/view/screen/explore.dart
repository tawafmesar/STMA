import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Canterbury',

                  color: Colors.black
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
          SizedBox(
            width: 250.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
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


class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}



final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
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
                  'No. ${imgList.indexOf(item)} image',
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
))
    .toList();


