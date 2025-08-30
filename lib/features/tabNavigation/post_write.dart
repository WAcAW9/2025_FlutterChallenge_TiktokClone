import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';

class PostWrite extends StatefulWidget {
  const PostWrite({super.key});

  @override
  State<PostWrite> createState() => _PostWriteState();
}

class _PostWriteState extends State<PostWrite> {
  final TextEditingController _threadController = TextEditingController();

  String _thread = "";

  @override
  void initState() {
    super.initState();
    _threadController.addListener(() {
      setState(() {
        _thread = _threadController.text;
      });
    });
  }

  @override
  void dispose() {
    _threadController.dispose();
    super.dispose();
  }

  void _onClosePressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size16),
          topRight: Radius.circular(Sizes.size16),
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // 상단 Cancel + Title
              Padding(
                padding: EdgeInsets.all(Sizes.size16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => _onClosePressed(context),
                        child: Text('Cancel'),
                      ),
                    ),
                    Center(
                      child: Text(
                        'New thread',
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: Colors.grey.shade300),

              // 내용 영역
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Sizes.size16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FontAwesomeIcons.userCircle, size: Sizes.size28),
                      Gaps.h16,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jhon_mobbin',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            SizedBox(height: Sizes.size8),
                            Expanded(
                              child: TextField(
                                controller: _threadController,
                                textInputAction: TextInputAction.newline,
                                expands: true,
                                minLines: null,
                                maxLines: null,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  hintText: 'Start a thread...',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 하단 Post 버튼
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Anyone can reply'),

                  Text(
                    'Post',
                    style: TextStyle(
                      color: _thread.isEmpty
                          ? const Color.fromARGB(255, 115, 183, 255)
                          : const Color.fromARGB(255, 0, 97, 224),
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
