import 'dart:convert';

// var now = DateTime.now();

class notificationModel {
  final String title;
  final String body;
  final String time;

  notificationModel({required this.title, required this.body,required this.time });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'time': time,
    };
  }

  factory notificationModel.fromMap(Map<String, dynamic> map) {
    return notificationModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory notificationModel.fromJson(String source) =>
      notificationModel.fromMap(json.decode(source));
}
