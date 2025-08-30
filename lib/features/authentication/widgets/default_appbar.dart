import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Icon(FontAwesomeIcons.twitter, color: Colors.blue, size: 28),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      centerTitle: true,
      leading: Icon(FontAwesomeIcons.arrowLeft),
      scrolledUnderElevation: 0,
    );
  }
}
