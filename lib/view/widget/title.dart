import 'package:flutter/material.dart';

import '../../core/constant/color.dart';


class TitleMain extends StatelessWidget {
  final String text;
  final String image;


  const TitleMain({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      image,
                      fit: BoxFit.cover,
                      height: 30,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      text,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
