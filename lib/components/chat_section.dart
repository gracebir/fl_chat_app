import 'package:fl_chat_app/components/chat_box.dart';
import 'package:fl_chat_app/components/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart' as Sendbird;

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  TextEditingController _messageController = TextEditingController();
  Sendbird.GroupChannel? _channel;
  List<Sendbird.UserMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _joinOpenChannel();
  }

  Future<void> _joinOpenChannel() async {
    try {
      _channel = await Sendbird.GroupChannel.getChannel(
          'sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211');
      await _channel?.join();
      _channel?.markAsRead();
      // Fetch initial messages
      List<Sendbird.BaseMessage> initialMessages = await _channel!
          .getMessagesByTimestamp(
              DateTime.monthsPerYear, Sendbird.MessageListParams());
      setState(() {
        _messages.addAll(initialMessages.whereType<Sendbird.UserMessage>());
      });

      // Listen for new messages
    } catch (e) {
      print('Error joining open channel: $e');
    }
  }

  void _sendMessage(String text) async {
    try {
      if (_channel != null) {
        final params = Sendbird.UserMessageParams(message: text)
          ..customType = 'custom'
          ..mentionType = Sendbird.MentionType.users
          ..mentionedUserIds = ['Jeff', 'Julia'];

        await _channel!.sendUserMessage(params);
      } else {
        print('Channel is null. Cannot send message.');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // here the list of messages from the chanel
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return UserMessage(message: message.message);
            },
          ),
        ),
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
                    //button for sending message
                    GestureDetector(
                      onTap: () {
                        final text = _messageController.text.trim();
                        if (text.isNotEmpty) {
                          _sendMessage(text);
                          _messageController.clear();
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last, prefer_const_constructors
                        child: Icon(
                          Icons.arrow_upward,
                          size: 10,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffFF006B)),
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
