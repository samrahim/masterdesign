class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  NewsModel(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);
  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
        Source.fromJson(map['source']),
        map['author'],
        map['title'],
        map['description'],
        map['url'],
        map['urlToImage'],
        map['publishedAt'],
        map['content']);
  }
}

class Source {
  String? id;
  String? name;
  Source(this.id, this.name);
  factory Source.fromJson(Map<String, dynamic> map) {
    return Source(map['id'], map['name']);
  }
}
