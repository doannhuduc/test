import 'dart:convert';

class GetDataModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetDataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
