import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset("lib/images/avatar.png"),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              width: 255,
              decoration: BoxDecoration(
                  color: Color(0xff1A1A1A),
                  borderRadius: BorderRadius.circular(5)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "목이길어슬픈기린",
                    style: TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "오늘 저녁 식사 같이 하실 여성분? 제가 삽니다",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "3분 전",
              style: TextStyle(fontSize: 12, color: Color(0xff9C9CA3)),
            )
          ],
        )
      ],
    );
  }
}
