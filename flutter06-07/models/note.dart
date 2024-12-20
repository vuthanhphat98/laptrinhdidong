
class Note {
  int? id;
  String title;
  String content;
  DateTime createdAt;
  String username;

  Note({this.id,
    required this.title,
    required this.content,
    DateTime? createdAt,
    required this.username
  }) :  createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'username': username
    };
  }

  factory Note.fromMap(Map<String, dynamic> map){
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      username: map['username']
    );
  }
}
