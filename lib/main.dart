import 'package:fl_chat_app/pages/conversation_page.dart';
import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

void main() {
  final sendbird = SendbirdSdk(
      appId: "BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF",
      apiToken: 'f93b05ff359245af400aa805bafd2a091a173064');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConversatioPage(),
    );
  }
}
