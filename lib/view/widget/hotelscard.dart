import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
class HotelsCard extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final String? hotelimage;

  const HotelsCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.image,
    required this.hotelimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColor.cardColor, // Border color
            width: 3.0, // Border width
          ),
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ), // Border radius
        ),
        child: Column(
          children: <Widget>[
            Material(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25),
              ),
              color: AppColor.primaryTextColor,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      image,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
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
            Container(
              color: AppColor.clockOutline,
              child: Row(
                children: [
                  Container(
                    width: 130, // Set your desired width
                    height: 160, // Set your desired height
                    child: Image.network(
                      hotelimage!,
                    ),
                  ),
                  // Second column with text
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        desc,
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
    );
  }
}
