import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/widgets/H1.dart';
import 'package:tiktokclone/utils.dart';

final List<Map<String, dynamic>> _users = [
  {"name": "rjmithun", "account": "Mithun", "follower": 26.6},
  {"name": "vicenews", "account": "VICE News", "follower": 301},
  {"name": "trevornoah", "account": "Trevor Noah", "follower": 789},
  {
    "name": "condenasttraveller",
    "account": "Condé Nast Traveller",
    "follower": 130,
  },
  {"name": "chef_pillai", "account": "Suresh Pillai", "follower": 69.2},
  {"name": "malala", "account": "Malala Yousafzai", "follower": 237},
  {"name": "sebin_cyriac", "account": "Fishing_freaks", "follower": 53.2},
  {"name": "nasa", "account": "NASA", "follower": 95.0},
  {"name": "cristiano", "account": "Cristiano Ronaldo", "follower": 610},
  {"name": "leomessi", "account": "Lionel Messi", "follower": 490},
  {"name": "natgeo", "account": "National Geographic", "follower": 28},
  {"name": "billgates", "account": "Bill Gates", "follower": 410},
  {"name": "oprah", "account": "Oprah Winfrey", "follower": 200},
  {"name": "google", "account": "Google", "follower": 3},
  {"name": "instagram", "account": "Instagram", "follower": 660},
  {"name": "bbcnews", "account": "BBC News", "follower": 260},
  {"name": "taylorswift", "account": "Taylor Swift", "follower": 200},
];

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.size96,
        title: Padding(
          padding: EdgeInsetsGeometry.all(Sizes.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H1(text: "Search"),
              CupertinoSearchTextField(
                itemColor: isDark ? Colors.white60 : Colors.grey,
                cursorColor: Theme.of(context).primaryColor,
                backgroundColor: isDark
                    ? const Color.fromARGB(255, 65, 65, 65)
                    : Colors.grey.shade200,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(Sizes.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < _users.length; i++) ...[
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.circleUser,
                    size: Sizes.size36,
                  ),
                  title: Row(
                    children: [
                      Text(_users[i]["name"]),
                      Gaps.h5,
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      text: "${_users[i]["account"]}\n\n",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "${_users[i]["follower"]}K followers",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  isThreeLine: true,
                  trailing: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(Sizes.size10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size5,
                      horizontal: Sizes.size24,
                    ),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                // 마지막 아이템 뒤에는 Divider를 안 넣고 싶으면 조건문 추가
                if (i != _users.length - 1)
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    indent: Sizes.size52, // 아바타만큼 띄우기
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
