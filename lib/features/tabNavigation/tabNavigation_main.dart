import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/activities/activity_screen.dart';
import 'package:tiktokclone/features/search/search_screen.dart';
import 'package:tiktokclone/features/tabNavigation/post_home.dart';
import 'package:tiktokclone/features/tabNavigation/post_write.dart';
import 'package:tiktokclone/features/tabNavigation/widgets/nav_button.dart';
import 'package:tiktokclone/features/users/user_profile_screen.dart';

class TabnavigationMain extends StatefulWidget {
  const TabnavigationMain({super.key});

  @override
  State<TabnavigationMain> createState() => _TabnavigationMainState();
}

class _TabnavigationMainState extends State<TabnavigationMain> {
  int _selectedIndex = 0;

  void _onNavButtonTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostWriteTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // bottom sheet의 사이즈를 변경할 수 있게 한다.
      backgroundColor: Colors.transparent,
      builder: (context) => PostWrite(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: DefaultAppBar(),
      body: Stack(
        children: [
          Offstage(offstage: _selectedIndex != 0, child: PostHome()),
          Offstage(offstage: _selectedIndex != 1, child: SearchScreen()),
          // Offstage(offstage: _selectedIndex != 2, child: PostWrite()),
          Offstage(offstage: _selectedIndex != 3, child: ActivityScreen()),
          Offstage(offstage: _selectedIndex != 4, child: UserProfileScreen()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavButton(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              isTap: () => _onNavButtonTap(0),
            ),

            Gaps.v10,
            NavButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              selectedIcon: FontAwesomeIcons.magnifyingGlassPlus,
              isSelected: _selectedIndex == 1,
              isTap: () => _onNavButtonTap(1),
            ),

            Gaps.v10,
            NavButton(
              icon: FontAwesomeIcons.penToSquare,
              selectedIcon: FontAwesomeIcons.solidPenToSquare,
              isSelected: _selectedIndex == 2,
              isTap: () => _onPostWriteTap(context),
            ),

            Gaps.v10,
            NavButton(
              icon: FontAwesomeIcons.heart,
              selectedIcon: FontAwesomeIcons.solidHeart,
              isSelected: _selectedIndex == 3,
              isTap: () => _onNavButtonTap(3),
            ),
            Gaps.v10,
            NavButton(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              isTap: () => _onNavButtonTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
