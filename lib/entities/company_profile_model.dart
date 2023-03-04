// To parse this JSON data, do
//
//     final companyProfileModel = companyProfileModelFromJson(jsonString);

import 'dart:convert';

CompanyProfileModel companyProfileModelFromJson(String str) =>
    CompanyProfileModel.fromJson(json.decode(str));

String companyProfileModelToJson(CompanyProfileModel data) =>
    json.encode(data.toJson());

class CompanyProfileModel {
  CompanyProfileModel({
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
  dynamic foundedDate;
  String? organizationType;
  String? country;
  int? contactNumber;
  String? description;
  String? email;
  String? state;
  String? city;
  String? address;
  dynamic pincode;
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

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) =>
      CompanyProfileModel(
        jobDescription: JobDescription.fromJson(json["jobDescription"]),
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
        subscription: json["subscription"],
        subscriptionDetails:
            List<dynamic>.from(json["subscriptionDetails"].map((x) => x)),
        hrData: List<dynamic>.from(json["hrData"].map((x) => x)),
        v: json["__v"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "jobDescription": jobDescription!.toJson(),
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
        "subscription": subscription,
        "subscriptionDetails":
            List<dynamic>.from(subscriptionDetails!.map((x) => x)),
        "hrData": List<dynamic>.from(hrData!.map((x) => x)),
        "__v": v,
        "profileImage": profileImage,
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
