import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/tabNavigation/article_ellipsis.dart';

class PostHome extends StatelessWidget {
  const PostHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.size20),
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
    );
  }
}

class Article extends StatelessWidget {
  const Article({
    super.key,
    required this.nickname,
    required this.text,
    this.images = const [], // ✅ 기본값: 빈 리스트
  });

  final String nickname;
  final String text;
  final List<String> images; // ✅ 여러 장 이미지 지원

  void _onEllipsisTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      // isScrollControlled: true, // bottom sheet의 사이즈를 변경할 수 있게 한다.
      backgroundColor: Colors.transparent,
      builder: (context) => ArticleEllipsis(),
    );
  }
  // future을 반환하는데 이는 유저가 댓글 창을 닫으면 resolve 된다.
  // 즉 이 말의 의미는 다른 동작들이 기다린다. 모달 창이 끝날 때까지

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
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
                ],
              ),
            ),
            Gaps.h16,
            // ✅ Column이 가로 공간을 충분히 받도록 Expanded로 감싸기
            Flexible(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 상단 한 줄: 제목(왼쪽) — (오른쪽) 시간 + 더보기
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 왼쪽 텍스트가 길면 말줄임
                      Expanded(
                        child: Text(
                          nickname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text('2h'),
                          SizedBox(width: 8),
                          IconButton(
                            onPressed: () => _onEllipsisTap(context),
                            icon: FaIcon(FontAwesomeIcons.ellipsis),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(text, style: TextStyle(fontSize: Sizes.size16)),
                  Gaps.v10,

                  if (images.isNotEmpty) // ✅ 이미지가 있을 때만 출력
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: images.map((url) {
                          return Container(
                            width: 300,
                            height: 200,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                  Gaps.v10,
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.heart, size: Sizes.size24),
                      Gaps.h14,
                      FaIcon(FontAwesomeIcons.comment),
                      Gaps.h14,
                      FaIcon(FontAwesomeIcons.retweet),
                      Gaps.h14,
                      FaIcon(FontAwesomeIcons.paperPlane),
                      Gaps.h14,
                    ],
                  ),
                  Gaps.v10,
                  Text(
                    '2 repiles . 4 likes',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(), // 구분선은 Row 밖(컬럼 내부)에 배치]
      ],
    );
  }
}
