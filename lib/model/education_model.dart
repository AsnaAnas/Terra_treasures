


class PostModel {
  String id;
  String userId;
  String content;
  String type; // 'text', 'image', or 'video'
  DateTime timestamp;
  List<String> likes; // List of user IDs who liked the post

  PostModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'type': type,
      'timestamp': timestamp.toIso8601String(),
      'likes': likes,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      userId: map['userId'],
      content: map['content'],
      type: map['type'],
      timestamp: DateTime.parse(map['timestamp']),
      likes: List<String>.from(map['likes']),
    );
  }
}

