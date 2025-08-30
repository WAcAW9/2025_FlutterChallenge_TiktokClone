import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/widgets/H1.dart';
import 'package:tiktokclone/features/authentication/widgets/H5.dart';
import 'package:tiktokclone/features/authentication/widgets/default_appbar.dart';

const interests_detail = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation & comics",
  "Business & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Programming",
  "Math & Science",
  "Cultures",
  "Fashion & beauty",
];

const interests_detail2 = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation & comics",
  "Business & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Programming",
  "Math & Science",
  "Cultures",
  "Fashion & beauty",
];

const interests_detail3 = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation & comics",
  "Business & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Programming",
  "Math & Science",
  "Cultures",
  "Fashion & beauty",
];

class InterestDetailScreen extends StatefulWidget {
  final List<String> selectedTexts; // ✅ 선택된 관심사 저장

  const InterestDetailScreen({
    super.key,
    required this.selectedTexts, // ✅ 생성자에 추가
  });

  @override
  State<InterestDetailScreen> createState() => _InterestDetailScreenState();
}

class _InterestDetailScreenState extends State<InterestDetailScreen> {
  // 각 버튼의 선택 상태를 저장
  late List<bool> _isSelected;
  // 각 버튼의 선택 상태를 저장
  late List<bool> _isSelected2;
  // 각 버튼의 선택 상태를 저장
  late List<bool> _isSelected3;
  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(interests_detail.length, (_) => false);
    _isSelected2 = List.generate(interests_detail.length, (_) => false);
    _isSelected3 = List.generate(interests_detail.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H1(text: 'What do you want to see on Twitter?'),
              Gaps.v12,
              H5(
                text:
                    'Interests are used to personalize your experience and will be visible on your profile.',
              ),
              Gaps.v20,
              // 관심사

              // 여기부터 반복
              const Divider(),
              Text(
                widget.selectedTexts[0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size24,
                ),
              ),
              Gaps.v28,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 600,
                  child: Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: List.generate(interests_detail.length, (index) {
                      return InterestDeatilButton(
                        interest: interests_detail[index],
                        isSelected: _isSelected[index],
                        onTap: () {
                          setState(() {
                            _isSelected[index] = !_isSelected[index];
                          });
                        },
                      );
                    }),
                  ),
                ),
              ),
              Gaps.v28,
              //두번째
              const Divider(),
              Text(
                widget.selectedTexts[1],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size24,
                ),
              ),
              Gaps.v28,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 600,
                  child: Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: List.generate(interests_detail2.length, (index) {
                      return InterestDeatilButton(
                        interest: interests_detail2[index],
                        isSelected: _isSelected2[index],
                        onTap: () {
                          setState(() {
                            _isSelected2[index] = !_isSelected2[index];
                          });
                        },
                      );
                    }),
                  ),
                ),
              ),
              Gaps.v28,
              // 세번째
              const Divider(),
              Text(
                widget.selectedTexts[2],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size24,
                ),
              ),
              Gaps.v28,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 600,
                  child: Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: List.generate(interests_detail3.length, (index) {
                      return InterestDeatilButton(
                        interest: interests_detail3[index],
                        isSelected: _isSelected3[index],
                        onTap: () {
                          setState(() {
                            _isSelected3[index] = !_isSelected3[index];
                          });
                        },
                      );
                    }),
                  ),
                ),
              ),
              Gaps.v28,
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            CupertinoButton(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
              borderRadius: BorderRadius.circular(40),
              onPressed: () {},
              child: Text('Next', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestDeatilButton extends StatelessWidget {
  final String interest;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestDeatilButton({
    super.key,
    required this.interest,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(Sizes.size10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent.withOpacity(0.7) : Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size14,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
