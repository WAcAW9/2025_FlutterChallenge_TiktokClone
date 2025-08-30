import 'package:flutter/material.dart';
import 'package:tiktokclone/constrants/sizes.dart';

class H1 extends StatelessWidget {
  final String text;
  const H1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: Sizes.size32),
    );
  }
}
