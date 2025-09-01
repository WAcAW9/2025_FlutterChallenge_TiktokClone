import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isDarkMode(context)
                ? Colors.grey.shade700
                : Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: isDarkMode(context) ? Colors.white : Colors.black,
        labelPadding: EdgeInsets.only(bottom: Sizes.size10),
        tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: Text("Threads"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: Text("Repiles"),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 32;

  @override
  double get minExtent => 32;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
