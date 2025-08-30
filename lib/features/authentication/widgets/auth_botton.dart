import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;

  const AuthButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    // FractionallySizedBox: 기본적으로 box 위젯으로 단순히 픽셀로 크기를 정하지 않고 부모의 크기에 비례해 정해줌
    // widthFactor : 1 -> 부모의 100%

    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: Sizes.size1),
        ),
        child: Stack(
          // row/column
          // stack 서로 위에 쌓을 수 있게 해줌
          alignment: Alignment.center,

          children: [
            // 중앙 정렬된 상태에서 아이콘만 옆으로 미는 방법 중 하나
            // Expanded : Row 나 Column 내에서 사용할 수 있는 만큼 공간을 전부 차지하는 위젯
            Align(alignment: Alignment.centerLeft, child: icon),

            // Align 위젯은 Stack 에 있는 Widget 하나의 정렬만 바꿀 수 있게 해줌 : 개별정렬
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: Sizes.size16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
