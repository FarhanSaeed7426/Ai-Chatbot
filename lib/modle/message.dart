class Message {
  late final String msg;
  final MessageType msgType;
  final bool copyable; // Whether the message can be copied
  final bool editable; // Whether the message is editable

  Message({
    required this.msg,
    required this.msgType,
    this.copyable = false,
    this.editable = false,
  });
}

enum MessageType {
  bot,
  user,
}