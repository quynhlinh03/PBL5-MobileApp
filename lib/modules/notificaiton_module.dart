import 'dart:convert';

class notificationModel {
  final String title;
  final String body;

  notificationModel({required this.title, required this.body});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
    };
  }

  factory notificationModel.fromMap(Map<String, dynamic> map) {
    return notificationModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory notificationModel.fromJson(String source) => notificationModel.fromMap(json.decode(source));
}
