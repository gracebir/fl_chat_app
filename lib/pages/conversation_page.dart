// ignore_for_file: sort_child_properties_last

import 'package:fl_chat_app/components/chat_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConversatioPage extends StatelessWidget {
  const ConversatioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "강남스팟",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xffFCFCFC)),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: SvgPicture.asset('lib/images/btcon_back.svg'),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'lib/images/menu.svg',
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
      body: ChatSection(),
    );
  }
}
