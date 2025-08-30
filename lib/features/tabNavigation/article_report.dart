import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';

class ArticleReport extends StatelessWidget {
  ArticleReport({super.key});

  void _onPress(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  final List<String> reasons = [
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbols",
    "Nudity or sexual activity",
    "Other reason",
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbols",
    "Nudity or sexual activity",
    "Other reason",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(Sizes.size16)),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(Sizes.size32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Report',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gaps.v12,
                Text(
                  'Why are you reporting this thread?',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v9,
                Text(
                  "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          // ListView만 스크롤 담당
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
              itemCount: reasons.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reasons[index],
                      style: TextStyle(fontSize: Sizes.size16),
                    ),
                    IconButton(
                      onPressed: () => _onPress(context),
                      icon: FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: Sizes.size14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
