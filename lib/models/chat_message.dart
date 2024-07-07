class ChatMessage {
  final int id;
  final int sessionId;
  final String message;
  final int sender;

  ChatMessage({this.id, this.sessionId, this.message, this.sender});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'session_id': sessionId,
      'message': message,
      'sender': sender,
    };
  }
  
  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'],
      sessionId: map['session_id'],
      message: map['message'],
      sender: map['sender'],
    );
  }
}
