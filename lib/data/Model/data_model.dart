import 'dart:convert';


class Data {
  final int percent_leg;
  final int percent_shoulder;
  final int percent_head;
  final DateTime time;
  final bool status;
  Data({
    required this.percent_leg,
    required this.percent_shoulder,
    required this.percent_head,
    required this.time,
    required this.status,
  });



  Data copyWith({
    int? percent_leg,
    int? percent_shoulder,
    int? percent_head,
    DateTime? time,
    bool? status,
  }) {
    return Data(
      percent_leg: percent_leg ?? this.percent_leg,
      percent_shoulder: percent_shoulder ?? this.percent_shoulder,
      percent_head: percent_head ?? this.percent_head,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'percent_leg': percent_leg,
      'percent_shoulder': percent_shoulder,
      'percent_head': percent_head,
      'time': time.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      percent_leg: map['percent_leg']?.toInt() ?? 0,
      percent_shoulder: map['percent_shoulder']?.toInt() ?? 0,
      percent_head: map['percent_head']?.toInt() ?? 0,
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(percent_leg: $percent_leg, percent_shoulder: $percent_shoulder, percent_head: $percent_head, time: $time, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.percent_leg == percent_leg &&
      other.percent_shoulder == percent_shoulder &&
      other.percent_head == percent_head &&
      other.time == time &&
      other.status == status;
  }

  @override
  int get hashCode {
    return percent_leg.hashCode ^
      percent_shoulder.hashCode ^
      percent_head.hashCode ^
      time.hashCode ^
      status.hashCode;
  }
}
