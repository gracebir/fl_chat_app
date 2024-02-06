import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  final String? message;
  UserMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 10, top: 10, bottom: 10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFF006B),
              Color(0xffFF4593)
            ], // Set your desired gradient colors
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(16))),
      child: Text(
        message!,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
