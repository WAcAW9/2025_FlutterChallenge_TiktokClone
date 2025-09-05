import 'package:flutter/material.dart';

class PostConfigData extends InheritedWidget {
  PostConfigData({
    required super.child,
    required this.egg,
    required this.toggleEgg,
  });
  final bool egg;
  final void Function() toggleEgg;

  static PostConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PostConfigData>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

// 내부 값을 변경하기 위해 추가
class PostConfig extends StatefulWidget {
  final Widget child;
  const PostConfig({super.key, required this.child});

  @override
  State<PostConfig> createState() => _PostConfigState();
}

class _PostConfigState extends State<PostConfig> {
  bool egg = true; // 여기로 변수를 가져옴

  void toggleEgg() {
    setState(() {
      egg = !egg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PostConfigData(toggleEgg: toggleEgg, child: widget.child, egg: egg);
  }
}
