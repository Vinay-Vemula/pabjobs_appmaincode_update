// To parse this JSON data, do
//
//     final postJobModel = postJobModelFromJson(jsonString);

import 'dart:convert';

PostJobModel postJobModelFromJson(String str) =>
    PostJobModel.fromJson(json.decode(str));

String postJobModelToJson(PostJobModel data) => json.encode(data.toJson());

class PostJobModel {
  PostJobModel({
    this.title,
    this.maxPositions,
    this.jobType,
    this.experience,
    this.country,
    this.deadline,
    this.education,
    this.description,
    this.salary,
    this.skillsets,
    this.cities,
  });

  String? title;
  String? maxPositions;
  String? jobType;
  String? experience;
  String? country;
  String? deadline;
  String? education;
  String? description;
  String? salary;
  List<dynamic>? skillsets;
  List<dynamic>? cities;

  factory PostJobModel.fromJson(Map<String, dynamic> json) => PostJobModel(
        title: json["title"],
        maxPositions: json["maxPositions"],
        jobType: json["jobType"],
        experience: json["experience"],
        country: json["country"],
        deadline: json["deadline"],
        education: json["education"],
        description: json["description"],
        salary: json["salary"],
        skillsets: json["skillsets"] == null
            ? null
            : List<dynamic>.from(json["skillsets"].map((x) => x)),
        cities: json["cities"] == null
            ? null
            : List<dynamic>.from(json["cities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "maxPositions": maxPositions,
        "jobType": jobType,
        "experience": experience,
        "country": country,
        "deadline": deadline,
        "education": education,
        "description": description,
        "salary": salary,
        "skillsets": List<dynamic>.from(skillsets!.map((x) => x)),
        "cities": List<dynamic>.from(cities!.map((x) => x)),
      };
}
