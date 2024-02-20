import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 450,
      child: Image.asset(
        AppImageAsset.logo,
        fit: BoxFit.contain, // You can choose the appropriate fit based on your needs
      ),
    );
  }
}