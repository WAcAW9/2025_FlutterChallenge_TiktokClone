import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/utils.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
    required this.isTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final Function isTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // ❗ 크기를 내용물만큼만
      children: [
        GestureDetector(
          onTap: () => isTap(),
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.5,
            duration: Duration(milliseconds: 200),
            child: Container(
              child: FaIcon(
                isSelected ? selectedIcon : icon,
                size: Sizes.size28,
                color: Theme.of(context).iconTheme.color, // ✅ 테마에서 가져오기
              ),
            ),
          ),
        ),
      ],
    );
  }
}
