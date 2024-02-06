class MessageModel {
  final String userId;
  final String message;
  final String name;
  final String timestamp;

  MessageModel(
      {required this.userId,
      required this.message,
      required this.name,
      required this.timestamp});
}
