import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  final List<Widget> fancyCards = <Widget>[
    FancyCard(
      image: Image.asset("assets/images/ulaa.jpg"),
      title: "Say hello to planets!",
    ),
    FancyCard(
      image: Image.asset("assets/images/num1.jpg"),
      title: "Don't be sad!",
    ),
    FancyCard(
      image: Image.asset("assets/images/num1.jpeg"),
      title: "Go for a walk!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StackedCardCarousel(
        items: fancyCards,
      ),
    );
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    super.key,
    required this.image,
    required this.title,
  });

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            OutlinedButton(
              child: const Text("Learn more"),
              onPressed: () => print("Button was tapped"),
            ),
          ],
        ),
      ),
    );
  }
}