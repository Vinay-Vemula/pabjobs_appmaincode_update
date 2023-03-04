// To parse this JSON data, do
//
//     final jobFairModel = jobFairModelFromJson(jsonString);

import 'dart:convert';

JobFairModel jobFairModelFromJson(String str) =>
    JobFairModel.fromJson(json.decode(str));

String jobFairModelToJson(JobFairModel data) => json.encode(data.toJson());

class JobFairModel {
  JobFairModel({
    this.data,
    this.isApplied,
  });

  Data? data;
  bool? isApplied;

  factory JobFairModel.fromJson(Map<String, dynamic> json) => JobFairModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        isApplied: json["isApplied"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "isApplied": isApplied,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.phone,
    this.education,
    this.userId,
    this.fileSrc,
    this.createdAt,
    this.v,
  });

  String? id;
  String? name;
  int? phone;
  String? education;
  String? userId;
  String? fileSrc;
  DateTime? createdAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        education: json["education"] == null ? null : json["education"],
        userId: json["userId"] == null ? null : json["userId"],
        fileSrc: json["fileSrc"] == null ? null : json["fileSrc"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "education": education == null ? null : education,
        "userId": userId == null ? null : userId,
        "fileSrc": fileSrc == null ? null : fileSrc,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
