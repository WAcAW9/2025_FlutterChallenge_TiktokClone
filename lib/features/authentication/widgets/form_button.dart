import 'package:flutter/material.dart';
import 'package:tiktokclone/constrants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.disable});

  final bool disable;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        // 애니메이션 추가 위젯의 장식 변화에 대해
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disable // 유저네임이 채워지면 창 활성화
              ? Colors.grey.shade300
              : Theme.of(context).primaryColor,
        ),
        duration: Duration(milliseconds: 300), // 애니메이션 재생 기간
        child: AnimatedDefaultTextStyle(
          // 텍스트 애니메이션
          style: TextStyle(
            color: disable ? Colors.grey : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          duration: Duration(milliseconds: 300),
          child: Text('Next', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
