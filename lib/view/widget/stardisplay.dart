import 'package:flutter/material.dart';


class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data:const IconThemeData(
        color: Colors.amber,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < value ? Icons.star : Icons.star_border,
          );
        }),
      ),
    );
  }
}
