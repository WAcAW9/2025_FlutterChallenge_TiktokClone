import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/utils.dart';

final _tabs = ["All", "Replies", "Mentions", "Likes"];

final List<Map<String, dynamic>> _users = [
  {
    "name": "john_mobbin",
    "alrt": "Mentioned you",
    "message":
        "Here's a thread you should follow if you love botany @jane_mobbin",
    "hour": 4,
    "following": false,
  },
  {
    "name": "john_mobbin",
    "alrt": "Starting out my gardening club with thr...",
    "message": "Count me in!",
    "hour": 4,
    "following": false,
  },
  {
    "name": "the.plantdads",
    "alrt": "Followed you",
    "message": null,
    "hour": 5,
    "following": true,
  },
  {
    "name": "the.plantdads",
    "alrt": "Definitely broken! 🧵👀🌿",
    "message": null,
    "hour": 5,
    "following": false,
  },
  {
    "name": "theberryjungle",
    "alrt": "🌿👀🧵",
    "message": null,
    "hour": 5,
    "following": false,
  },
];

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // int _selectedIndex = 0; // 현재 선택된 버튼 인덱스

  // void _onTap(int index) {
  //   setState(() {
  //     _selectedIndex = index; // 하나만 선택되도록 갱신
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return DefaultTabController(
      length: _tabs.length,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
          title: Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size32,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.start,
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: isDark ? Colors.white : Colors.black,
            indicatorColor: isDark ? Colors.white : Colors.black,
            indicator: const BoxDecoration(color: Colors.transparent),
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            tabs: [for (var tab in _tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ), // 전체 가로 패딩만 적용
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < _users.length; i++) ...[
                      ListTile(
                        // 🚨 마진 제거 핵심: contentPadding을 0으로 설정
                        contentPadding: EdgeInsets.zero,
                        leading: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.userCircle,
                              size: 40,
                              color: Colors.grey,
                            ),
                            Positioned(
                              left: 20,
                              top: 20,
                              child: FaIcon(FontAwesomeIcons.circlePlus),
                            ),
                          ],
                        ),
                        title: Row(
                          children: [
                            Text(
                              _users[i]["name"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.h5,
                            Text(
                              "${_users[i]["hour"]}h",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        // 🚨 마진 제거 핵심 2: isThreeLine을 제거하거나 false로 설정
                        // isThreeLine: false, // 기본값이므로 제거해도 됨

                        // 🚨 마진 제거 핵심 3: 줄바꿈 문자를 최소화하고, RichText 대신 Column 사용을 고려
                        // 현재 코드에서는 RichText를 유지하되, 불필요한 줄바꿈 제거
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // alrt (Mentioned you, Followed you 등)
                            Text(
                              "${_users[i]["alrt"] ?? ''}", // null 처리
                              style: const TextStyle(color: Colors.grey),
                            ),
                            // message (실제 스레드 메시지)
                            if (_users[i]["message"] != null) ...[
                              Gaps.v5, // alrt와 message 사이의 작은 간격
                              Text(_users[i]["message"]),
                            ],
                            // ListTile의 subtitle이 기본적으로 아래쪽에 마진을 주는 경향이 있으므로
                            // Column을 사용하면 제어가 더 용이합니다.
                          ],
                        ),
                        trailing: _users[i]["following"]
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size5,
                                  horizontal: Sizes.size20,
                                ),
                                child: const Text(
                                  'following',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: Sizes.size14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : null, // Text("") 대신 null을 사용해 트레일링 위젯이 없는 경우 공간을 차지하지 않도록 합니다.
                      ),
                      // ListTile 자체에 수직 마진이 없기 때문에 Divider 전후에 간격을 수동으로 추가해야 할 수도 있습니다.
                      // 이 예제에서는 Divider를 ListTile 바로 아래에 배치하여 간결하게 유지합니다.
                      if (i != _users.length - 1)
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          // 아바타와 동일한 크기(ListTile의 leading 영역)만큼 들여쓰기
                          indent:
                              Sizes.size28 + 16, // 아바타 사이즈(28) + 기본 패딩(16) 정도
                        ),
                    ],
                  ],
                ),
              ),
            ),
            for (var tab in _tabs.skip(1))
              Center(child: Text(tab, style: TextStyle(fontSize: 28))),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    //     toolbarHeight: Sizes.size96,
    //     title: H1(text: "Activity"),
    //     bottom: PreferredSize(
    //       preferredSize: Size.fromHeight(Sizes.size10), // 높이 조정
    //       child: SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: Sizes.size10,
    //             vertical: Sizes.size10,
    //           ), // 패딩 조정
    //           child: Row(
    //             children: [
    //               for (var i = 0; i < _tabs.length; i++)
    //                 GestureDetector(
    //                   onTap: () => _onTap(i),
    //                   child: AnimatedContainer(
    //                     duration: Duration(milliseconds: 300),
    //                     alignment: Alignment.center,
    //                     width: Sizes.size96 + Sizes.size10,
    //                     margin: EdgeInsets.only(right: Sizes.size5),
    //                     decoration: BoxDecoration(
    //                       color: _selectedIndex == i
    //                           ? Colors.black
    //                           : Colors.white,
    //                       border: Border.all(color: Colors.grey),
    //                       borderRadius: BorderRadius.circular(Sizes.size10),
    //                     ),
    //                     padding: EdgeInsets.symmetric(vertical: Sizes.size5),
    //                     child: Text(
    //                       _tabs[i],
    //                       style: TextStyle(
    //                         fontSize: Sizes.size16,
    //                         fontWeight: FontWeight.bold,
    //                         color: _selectedIndex == i
    //                             ? Colors.white
    //                             : Colors.black,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),

    //           body: TabBarView(
    //       children: [
    //         for (var tab in _tabs)
    //           Center(child: Text(tab, style: TextStyle(fontSize: 28))),
    //       ],
    //     ),
    // body: SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: Sizes.size10,
    //     ), // 전체 가로 패딩만 적용
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         for (var i = 0; i < _users.length; i++) ...[
    //           ListTile(
    //             // 🚨 마진 제거 핵심: contentPadding을 0으로 설정
    //             contentPadding: EdgeInsets.zero,
    //             leading: Stack(
    //               clipBehavior: Clip.none,
    //               children: [
    //                 FaIcon(
    //                   FontAwesomeIcons.userCircle,
    //                   size: 40,
    //                   color: Colors.grey,
    //                 ),
    //                 Positioned(
    //                   left: 20,
    //                   top: 20,
    //                   child: FaIcon(FontAwesomeIcons.circlePlus),
    //                 ),
    //               ],
    //             ),
    //             title: Row(
    //               children: [
    //                 Text(
    //                   _users[i]["name"],
    //                   style: const TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //                 Gaps.h5,
    //                 Text(
    //                   "${_users[i]["hour"]}h",
    //                   style: const TextStyle(color: Colors.grey),
    //                 ),
    //               ],
    //             ),
    //             // 🚨 마진 제거 핵심 2: isThreeLine을 제거하거나 false로 설정
    //             // isThreeLine: false, // 기본값이므로 제거해도 됨

    //             // 🚨 마진 제거 핵심 3: 줄바꿈 문자를 최소화하고, RichText 대신 Column 사용을 고려
    //             // 현재 코드에서는 RichText를 유지하되, 불필요한 줄바꿈 제거
    //             subtitle: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 // alrt (Mentioned you, Followed you 등)
    //                 Text(
    //                   "${_users[i]["alrt"] ?? ''}", // null 처리
    //                   style: const TextStyle(color: Colors.grey),
    //                 ),
    //                 // message (실제 스레드 메시지)
    //                 if (_users[i]["message"] != null) ...[
    //                   Gaps.v5, // alrt와 message 사이의 작은 간격
    //                   Text(
    //                     _users[i]["message"],
    //                     style: const TextStyle(color: Colors.black),
    //                   ),
    //                 ],
    //                 // ListTile의 subtitle이 기본적으로 아래쪽에 마진을 주는 경향이 있으므로
    //                 // Column을 사용하면 제어가 더 용이합니다.
    //               ],
    //             ),
    //             trailing: _users[i]["following"]
    //                 ? Container(
    //                     decoration: BoxDecoration(
    //                       border: Border.all(
    //                         color: Colors.grey.shade300,
    //                         width: 1,
    //                       ),
    //                       borderRadius: BorderRadius.circular(Sizes.size10),
    //                     ),
    //                     padding: const EdgeInsets.symmetric(
    //                       vertical: Sizes.size5,
    //                       horizontal: Sizes.size20,
    //                     ),
    //                     child: const Text(
    //                       'following',
    //                       style: TextStyle(
    //                         color: Colors.grey,
    //                         fontSize: Sizes.size14,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   )
    //                 : null, // Text("") 대신 null을 사용해 트레일링 위젯이 없는 경우 공간을 차지하지 않도록 합니다.
    //           ),
    //           // ListTile 자체에 수직 마진이 없기 때문에 Divider 전후에 간격을 수동으로 추가해야 할 수도 있습니다.
    //           // 이 예제에서는 Divider를 ListTile 바로 아래에 배치하여 간결하게 유지합니다.
    //           if (i != _users.length - 1)
    //             Divider(
    //               color: Colors.grey.shade300,
    //               thickness: 1,
    //               // 아바타와 동일한 크기(ListTile의 leading 영역)만큼 들여쓰기
    //               indent: Sizes.size28 + 16, // 아바타 사이즈(28) + 기본 패딩(16) 정도
    //             ),
    //         ],
    //       ],
    //     ),
    //   ),
    // ),
    // );
  }
}
