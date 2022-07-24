import 'dart:convert';

class News {
  News({
    required this.title,
    required this.language,
    required this.simpleUrl,
    required this.inewsWebUrl,
    required this.imgSd,
    required this.imgHd,
  });

  final String? title;
  final String? language;
  final String? simpleUrl;
  final String? inewsWebUrl;
  final String? imgSd;
  final String? imgHd;

  News copyWith({
    String? title,
    String? language,
    String? simpleUrl,
    String? inewsWebUrl,
    String? imgSd,
    String? imgHd,
  }) =>
      News(
        title: title ?? this.title,
        language: language ?? this.language,
        simpleUrl: simpleUrl ?? this.simpleUrl,
        inewsWebUrl: inewsWebUrl ?? this.inewsWebUrl,
        imgSd: imgSd ?? this.imgSd,
        imgHd: imgHd ?? this.imgHd,
      );

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory News.fromMap(Map<String, dynamic> json) => News(
        title: json["title"],
        language: json["language"],
        simpleUrl: json["simpleUrl"],
        inewsWebUrl: json["inewsWebUrl"],
        imgSd: json["imgSD"],
        imgHd: json["imgHD"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "language": language,
        "simpleUrl": simpleUrl,
        "inewsWebUrl": inewsWebUrl,
        "imgSD": imgSd,
        "imgHD": imgHd,
      };
}
