import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/post_configuration/post_config.dart';
import 'package:tiktokclone/features/post_configuration/post_config2.dart';
import 'package:tiktokclone/features/post_configuration/post_config3.dart';
import 'package:tiktokclone/features/post_configuration/post_config4.dart';
import 'package:tiktokclone/features/settings/settings_screen.dart';
import 'package:tiktokclone/features/tabNavigation/view_models/darkscreen_configvm.dart';
import 'package:tiktokclone/features/tabNavigation/views/post_home.dart';
import 'package:tiktokclone/features/users/widgets/persist_tab_bar.dart';
import 'package:tiktokclone/utils.dart';

class UserProfileScreen extends StatefulWidget {
  static const String routeName = '/profile'; // 추가!
  final String username;
  final String tab;
  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // bool _egg3 = postConfig3.value;

  // @override
  // void initState() {
  //   super.initState();

  //   postConfig3.addListener(() {
  //     setState(() {
  //       _egg3 = postConfig3.value;
  //     });
  //   });
  // }

  void _onGearPressed() {
    context.push(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    // final postConfig = context.dependOnInheritedWidgetOfExactType<PostConfig>();
    // // print(postConfig?.egg);
    // PostConfigData.of(context).egg;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: widget.tab == "likes" ? 1 : 0,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: FaIcon(
                    FontAwesomeIcons.globe,
                    color: isDark ? Colors.white60 : Colors.grey,
                  ),
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: FaIcon(
                        FontAwesomeIcons.gear,
                        color: isDark ? Colors.white60 : Colors.grey,
                      ),
                    ),
                  ],
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // context.watch<PostConfig4>().egg
                                  context.watch<DarkscreenConfigvm>().isdark
                                      ? 'wacaw'
                                      : widget.username,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size28,
                                  ),
                                ),
                                Text('jane_mobbin'),
                                Gaps.v10,
                                Text('Plant enthusiast!'),
                                Gaps.v10,
                                Text(
                                  "2 followers",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 30,
                              foregroundColor: Colors.teal,
                              foregroundImage: NetworkImage(
                                "https://vrthumb.clipartkorea.co.kr/2024/03/22/ti122a19103_01.jpg",
                              ),
                              child: Text(false ? 'EGG' : 'WACAW'),
                            ),
                          ],
                        ),
                      ),

                      Gaps.v14,

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: Sizes.size20,
                          children: [
                            Expanded(
                              child: FractionallySizedBox(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),

                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Sizes.size4),
                                    ),
                                  ),
                                  child: Text(
                                    'Edit profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: FractionallySizedBox(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),

                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Sizes.size4),
                                    ),
                                  ),
                                  child: Text(
                                    'Share profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Gaps.v20,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Sizes.size20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // 하나
                        Article(
                          nickname: 'pubity',
                          text: 'Vine after seeing the Threads logo unveiled',
                          images: [
                            'http://www.cnet.com/a/img/resize/3aa4b40d206a971719d8bc25c15aee909d91aef9/hub/2024/04/25/e6ea638f-79d4-48b4-9dd9-c07db8bf759b/threads-logo-gettyimages-1817749232.jpg?auto=webp&fit=crop&height=675&width=1200',
                          ],
                        ),
                        Article(
                          nickname: 'thetinderblog',
                          text: 'Elon alone on Twitter right now ...',
                          images: [
                            'https://media.istockphoto.com/id/517188688/ko/%EC%82%AC%EC%A7%84/%EC%82%B0-%ED%92%8D%EA%B2%BD.jpg?s=612x612&w=0&k=20&c=8o6qYjT0DMmAjvqWcWhwUmTEmsOZq5I0l2zGJ5jTMjA=',
                          ],
                        ),
                        Article(
                          nickname: 'tropicalseductions ',
                          text: 'Drop a comment here to test things out.',
                        ),
                        Article(
                          nickname: 'shityoushouldcareabout',
                          text:
                              'my phone feels like a vibrator with all these notifications rn',
                        ),
                        Article(
                          nickname: '_plantswithkrystal',
                          text:
                              'If you\'re reading this, go water that thirsty plant. You\'re welcome',
                        ),
                        Article(
                          nickname: 'timferriss',
                          text: 'Photoshoot with Molly pup. :)',
                          images: [
                            "http://images.mypetlife.co.kr/content/uploads/2017/11/09160100/dog-3226922_960_720.jpg",
                            "http://flexible.img.hani.co.kr/flexible/normal/965/643/imgdb/original/2019/1029/20191029500524.jpg",
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(child: Text('No Repiles')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
