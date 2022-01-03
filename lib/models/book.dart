class Book {
  int id;
  String title;
  String author;
  String description;

  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.description});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['title'],
        author: json['author'],
        description: json['description']);
  }
}