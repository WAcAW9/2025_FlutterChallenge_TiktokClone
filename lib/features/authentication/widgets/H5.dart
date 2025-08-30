import 'package:flutter/material.dart';
import 'package:tiktokclone/constrants/sizes.dart';

class H5 extends StatelessWidget {
  final String text;
  const H5({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.black87, fontSize: Sizes.size16),
    );
  }
}
