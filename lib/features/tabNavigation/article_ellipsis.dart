import 'package:flutter/material.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/tabNavigation/article_report.dart';

class ArticleEllipsis extends StatelessWidget {
  const ArticleEllipsis({super.key});

  void _onReportTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // bottom sheet의 사이즈를 변경할 수 있게 한다.
      backgroundColor: Colors.transparent,
      builder: (context) => ArticleReport(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // 배경색 필수!
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size16),
          topRight: Radius.circular(Sizes.size16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(Sizes.size32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Sizes.size16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.size16),
                  topRight: Radius.circular(Sizes.size16),
                ),
              ),
              child: Text(
                'Unfollow',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Sizes.size16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.size16),
                  bottomRight: Radius.circular(Sizes.size16),
                ),
              ),
              child: Text(
                'Mute',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gaps.v16,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Sizes.size16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.size16),
                  topRight: Radius.circular(Sizes.size16),
                ),
              ),
              child: Text(
                'Hide',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Sizes.size16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.size16),
                  bottomRight: Radius.circular(Sizes.size16),
                ),
              ),
              child: GestureDetector(
                onTap: () => _onReportTap(context),
                child: Text(
                  'Report',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
