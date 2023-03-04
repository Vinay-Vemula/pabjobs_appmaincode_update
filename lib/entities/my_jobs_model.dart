// To parse this JSON data, do
//
//     final myJobsModel = myJobsModelFromJson(jsonString);

import 'dart:convert';

List<MyJobsModel> myJobsModelFromJson(String str) => List<MyJobsModel>.from(
    json.decode(str).map((x) => MyJobsModel.fromJson(x)));

String myJobsModelToJson(List<MyJobsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyJobsModel {
  MyJobsModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.experience,
    this.maxPositions,
    this.activeApplications,
    this.acceptedCandidates,
    this.dateOfPosting,
    this.postedAt,
    this.deadline,
    this.skillsets,
    this.cities,
    this.jobType,
    this.country,
    this.education,
    this.salary,
    this.rating,
    this.v,
    this.recruiter,
  });

  String? id;
  String? userId;
  String? title;
  String? description;
  String? experience;
  int? maxPositions;
  int? activeApplications;
  int? acceptedCandidates;
  DateTime? dateOfPosting;
  String? postedAt;
  DateTime? deadline;
  List<String>? skillsets;
  List<String>? cities;
  String? jobType;
  String? country;
  String? education;
  String? salary;
  int? rating;
  int? v;
  Recruiter? recruiter;

  factory MyJobsModel.fromJson(Map<String, dynamic> json) => MyJobsModel(
        id: json["_id"],
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        experience: json["experience"],
        maxPositions: json["maxPositions"],
        activeApplications: json["activeApplications"],
        acceptedCandidates: json["acceptedCandidates"],
        dateOfPosting: DateTime.parse(json["dateOfPosting"]),
        postedAt: json["postedAt"],
        deadline: DateTime.parse(json["deadline"]),
        skillsets: List<String>.from(json["skillsets"].map((x) => x)),
        cities: List<String>.from(json["cities"].map((x) => x)),
        jobType: json["jobType"],
        country: json["country"],
        education: json["education"],
        salary: json["salary"],
        rating: json["rating"],
        v: json["__v"],
        recruiter: Recruiter.fromJson(json["recruiter"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "title": title,
        "description": description,
        "experience": experience,
        "maxPositions": maxPositions,
        "activeApplications": activeApplications,
        "acceptedCandidates": acceptedCandidates,
        "dateOfPosting": dateOfPosting!.toIso8601String(),
        "postedAt": postedAt,
        "deadline": deadline!.toIso8601String(),
        "skillsets": List<dynamic>.from(skillsets!.map((x) => x)),
        "cities": List<dynamic>.from(cities!.map((x) => x)),
        "jobType": jobType,
        "country": country,
        "education": education,
        "salary": salary,
        "rating": rating,
        "__v": v,
        "recruiter": recruiter!.toJson(),
      };
}

class Recruiter {
  Recruiter({
    this.id,
    this.userId,
    this.companyname,
    this.websitelink,
    this.foundedDate,
    this.organizationType,
    this.country,
    this.contactNumber,
    this.description,
    this.email,
    this.state,
    this.city,
    this.address,
    this.pincode,
    this.facebook,
    this.twitter,
    this.google,
    this.linkedin,
    this.createdAt,
    this.v,
  });

  String? id;
  String? userId;
  String? companyname;
  String? websitelink;
  dynamic? foundedDate;
  String? organizationType;
  String? country;
  int? contactNumber;
  String? description;
  String? email;
  String? state;
  String? city;
  String? address;
  dynamic? pincode;
  String? facebook;
  String? twitter;
  String? google;
  String? linkedin;
  DateTime? createdAt;
  int? v;

  factory Recruiter.fromJson(Map<String, dynamic> json) => Recruiter(
        id: json["_id"],
        userId: json["userId"],
        companyname: json["companyname"],
        websitelink: json["websitelink"],
        foundedDate: json["foundedDate"],
        organizationType: json["organizationType"],
        country: json["country"],
        contactNumber: json["contactNumber"],
        description: json["description"],
        email: json["email"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        pincode: json["pincode"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        google: json["google"],
        linkedin: json["linkedin"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "companyname": companyname,
        "websitelink": websitelink,
        "foundedDate": foundedDate,
        "organizationType": organizationType,
        "country": country,
        "contactNumber": contactNumber,
        "description": description,
        "email": email,
        "state": state,
        "city": city,
        "address": address,
        "pincode": pincode,
        "facebook": facebook,
        "twitter": twitter,
        "google": google,
        "linkedin": linkedin,
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}
