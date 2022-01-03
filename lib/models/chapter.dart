class Chapter {
  int id;
  int bookId;
  String chapter;
  String judulChapter;
  String isiChapter;

  Chapter(
      {required this.id,
      required this.bookId,
      required this.chapter,
      required this.judulChapter,
      required this.isiChapter});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
        id: json['id'],
        bookId: json['book_id'],
        chapter: json['chapter'],
        judulChapter: json['judul_chapter'],
        isiChapter: json['isi_chapter']);
  }
}