import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

NotificationEntity notificationEntityFromJson(String str) =>
    NotificationEntity.fromJson(json.decode(str));

String notificationEntityToJson(NotificationEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class NotificationEntity {
  @JsonKey()
  List<NotificationEntities> notificationEntities;

  NotificationEntity({
    required this.notificationEntities,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      NotificationEntity(
        notificationEntities: List<NotificationEntities>.from(
            json["result"].map((x) => NotificationEntities.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result":
            List<dynamic>.from(notificationEntities.map((x) => x.toJson())),
      };
}

@JsonSerializable()
class NotificationEntities {
  @JsonKey()
  bool isRead;
  @JsonKey()
  String title;
  @JsonKey()
  String message;
  @JsonKey()
  int durationMs;
  @JsonKey()
  String img;

  NotificationEntities({
    required this.isRead,
    required this.title,
    required this.message,
    required this.durationMs,
    required this.img,
  });

  factory NotificationEntities.fromJson(Map<String, dynamic> json) =>
      NotificationEntities(
        isRead: json["isRead"],
        title: json["title"],
        message: json["message"],
        durationMs: json["duration_ms"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "isRead": isRead,
        "title": title,
        "message": message,
        "duration_ms": durationMs,
        "img": img,
      };
}
