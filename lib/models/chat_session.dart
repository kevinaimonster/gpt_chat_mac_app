class ChatSession {
  final int id;
  final String title;
  final String createdAt;

  ChatSession({this.id, this.title, this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'created_at': createdAt,
    };
  }
  
  factory ChatSession.fromMap(Map<String, dynamic> map) {
    return ChatSession(
      id: map['id'],
      title: map['title'],
      createdAt: map['created_at'],
    );
  }
}
