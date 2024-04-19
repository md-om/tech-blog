class ListTags {
  String title;

  ListTags({required this.title});
}

class HotestArticle {
  String id;
  String imageUrl;
  String title;
  String date;
  String writer;
  String writerPhoto;
  String views;
  String content;

  HotestArticle(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.date,
      required this.writer,
      required this.writerPhoto,
      required this.views,
      required this.content});
}
