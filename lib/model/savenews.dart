class NewsDbModel {
  int? id;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;

  NewsDbModel({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }

  factory NewsDbModel.fromMap(Map<String, dynamic> dbData) {
    return NewsDbModel(
        id: dbData['id'],
        author: dbData['author'],
        title: dbData['title'],
        description: dbData['description'],
        urlToImage: dbData['urlToImage'],
        publishedAt: dbData['publishedAt']);
  }
}
