import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/widgets/H1.dart';
import 'package:tiktokclone/features/authentication/widgets/H5.dart';
import 'package:tiktokclone/features/authentication/widgets/default_appbar.dart';
import 'package:tiktokclone/features/onbording/interest_detail_screen.dart';

const interests = [
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
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  // 각 버튼의 선택 상태를 저장
  late List<bool> _isSelected;
  late List<String> _selectedTexts = [];

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(interests.length, (_) => false);
  }

  void _onNextTap() {
    // 첫 번째 화면
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            InterestDetailScreen(selectedTexts: _selectedTexts),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _selectedTexts = [
      for (int i = 0; i < interests.length; i++)
        if (_isSelected[i]) interests[i],
    ];
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const H1(text: 'What do you want to see on Twitter?'),
              Gaps.v12,
              const H5(
                text:
                    'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
              ),
              Gaps.v16,
              const Divider(),
              Gaps.v16,
              // 관심사 선택 부분
              Wrap(
                runSpacing: 15,
                spacing: 15,
                children: List.generate(interests.length, (index) {
                  return InterestButton(
                    interest: interests[index],
                    isSelected: _isSelected[index],
                    onTap: () {
                      setState(() {
                        _isSelected[index] = !_isSelected[index];
                      });
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTexts.length < 3
                  ? "${_selectedTexts.length} of 3 selected"
                  : "Great work!",
            ),
            Gaps.h10,
            CupertinoButton(
              color: _selectedTexts.length < 3 ? Colors.black45 : Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
              borderRadius: BorderRadius.circular(40),
              onPressed: _selectedTexts.length < 3 ? () {} : _onNextTap,
              child: const Text('Next', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestButton extends StatelessWidget {
  final String interest;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestButton({
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
        duration: const Duration(milliseconds: 300),
        width: 170,
        height: 80,
        padding: const EdgeInsets.all(Sizes.size7),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent.withOpacity(0.8) : Colors.white,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 8,
              child: Text(
                interest,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size16,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: FaIcon(
                FontAwesomeIcons.solidCheckCircle,
                color: isSelected ? Colors.white : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
