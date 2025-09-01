import 'package:flutter/material.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/utils.dart';

class H1 extends StatelessWidget {
  final String text;
  const H1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: Sizes.size32,
        color: isDark ? Colors.white : Colors.black,
      ),
    );
  }
}
