// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.jobAlerts,
    this.appliedJobs,
  });

  int? jobAlerts;
  int? appliedJobs;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        jobAlerts: json["jobAlerts"],
        appliedJobs: json["appliedJobs"],
      );

  Map<String, dynamic> toJson() => {
        "jobAlerts": jobAlerts,
        "appliedJobs": appliedJobs,
      };
}
