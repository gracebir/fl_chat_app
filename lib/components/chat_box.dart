import 'package:fl_chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  MessageModel message;

  ChatBox({super.key, required this.message});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.name,
                    style:
                        const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    message.message,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              message.timestamp,
              style: const TextStyle(fontSize: 12, color: Color(0xff9C9CA3)),
            )
          ],
        )
      ],
    );
  }
}
