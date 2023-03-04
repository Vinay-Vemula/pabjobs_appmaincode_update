// To parse this JSON data, do
//
//     final favouritesModel = favouritesModelFromJson(jsonString);

import 'dart:convert';

FavouritesModel favouritesModelFromJson(String str) =>
    FavouritesModel.fromJson(json.decode(str));

String favouritesModelToJson(FavouritesModel data) =>
    json.encode(data.toJson());

class FavouritesModel {
  FavouritesModel({
    this.data,
  });

  List<Datum>? data;

  factory FavouritesModel.fromJson(Map<String, dynamic> json) =>
      FavouritesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.jobId,
    this.v,
    this.recruiter,
  });

  String? id;
  String? userId;
  JobId? jobId;
  int? v;
  Recruiter? recruiter;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["userId"],
        jobId: JobId.fromJson(json["jobId"]),
        v: json["__v"],
        recruiter: Recruiter.fromJson(json["recruiter"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "jobId": jobId!.toJson(),
        "__v": v,
        "recruiter": recruiter!.toJson(),
      };
}

class JobId {
  JobId({
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

  factory JobId.fromJson(Map<String, dynamic> json) => JobId(
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
      };
}

class Recruiter {
  Recruiter({
    this.jobDescription,
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
    this.subscription,
    this.subscriptionDetails,
    this.hrData,
    this.v,
    this.profileImage,
  });

  JobDescription? jobDescription;
  String? id;
  String? userId;
  String? companyname;
  String? websitelink;
  DateTime? foundedDate;
  String? organizationType;
  String? country;
  int? contactNumber;
  String? description;
  String? email;
  String? state;
  String? city;
  String? address;
  int? pincode;
  String? facebook;
  String? twitter;
  String? google;
  String? linkedin;
  DateTime? createdAt;
  String? subscription;
  List<dynamic>? subscriptionDetails;
  List<dynamic>? hrData;
  int? v;
  String? profileImage;

  factory Recruiter.fromJson(Map<String, dynamic> json) => Recruiter(
        jobDescription: JobDescription.fromJson(json["jobDescription"]),
        id: json["_id"],
        userId: json["userId"],
        companyname: json["companyname"],
        websitelink: json["websitelink"],
        foundedDate: json["foundedDate"] == null
            ? null
            : DateTime.parse(json["foundedDate"]),
        organizationType: json["organizationType"],
        country: json["country"],
        contactNumber: json["contactNumber"],
        description: json["description"],
        email: json["email"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        google: json["google"],
        linkedin: json["linkedin"],
        createdAt: DateTime.parse(json["createdAt"]),
        subscription: json["subscription"],
        subscriptionDetails:
            List<dynamic>.from(json["subscriptionDetails"].map((x) => x)),
        hrData: List<dynamic>.from(json["hrData"].map((x) => x)),
        v: json["__v"],
        profileImage:
            json["profileImage"] == null ? null : json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "jobDescription": jobDescription!.toJson(),
        "_id": id,
        "userId": userId,
        "companyname": companyname,
        "websitelink": websitelink,
        "foundedDate":
            foundedDate == null ? null : foundedDate!.toIso8601String(),
        "organizationType": organizationType,
        "country": country,
        "contactNumber": contactNumber,
        "description": description,
        "email": email,
        "state": state,
        "city": city,
        "address": address,
        "pincode": pincode == null ? null : pincode,
        "facebook": facebook,
        "twitter": twitter,
        "google": google,
        "linkedin": linkedin,
        "createdAt": createdAt!.toIso8601String(),
        "subscription": subscription,
        "subscriptionDetails":
            List<dynamic>.from(subscriptionDetails!.map((x) => x)),
        "hrData": List<dynamic>.from(hrData!.map((x) => x)),
        "__v": v,
        "profileImage": profileImage == null ? null : profileImage,
      };
}

class JobDescription {
  JobDescription({
    this.filename,
    this.url,
  });

  String? filename;
  String? url;

  factory JobDescription.fromJson(Map<String, dynamic> json) => JobDescription(
        filename: json["filename"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "url": url,
      };
}
