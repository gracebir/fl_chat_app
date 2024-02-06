import 'package:fl_chat_app/components/chat_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            child: Column(children: [
          ChatBox(),
          SizedBox(
            height: 10,
          ),
          ChatBox(),
          SizedBox(
            height: 10,
          ),
          ChatBox(),
          SizedBox(
            height: 10,
          ),
          ChatBox(),
        ])),
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  // ignore: sort_child_properties_last, prefer_const_constructors
                  child: SvgPicture.asset("lib/images/add.svg"),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff333333)),
                    color: const Color(0xff323232),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: '메세지 보내기',
                          hintStyle:
                              TextStyle(color: Color(0xff666666), fontSize: 14),
                          fillColor: Color(0xff323232),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none, // Remove border
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last, prefer_const_constructors
                        child: SvgPicture.asset("lib/images/chat_send.svg"),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        )
      ],
    );
  }
}
