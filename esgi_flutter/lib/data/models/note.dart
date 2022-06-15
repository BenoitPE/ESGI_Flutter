class Note {
  final int id;
  final String title;
  final String date;
  final String content;
  final String image;

  Note(
      {required this.id,
      required this.title,
      required this.date,
      required this.content,
      required this.image});

  factory Note.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String title = json['title'];
    String date = json['date'];
    String content = json['content'];
    String image = json['image'];
    return Note(
        id: id, title: title, date: date, content: content, image: image);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'content': content,
      'image': image,
    };
  }
}
