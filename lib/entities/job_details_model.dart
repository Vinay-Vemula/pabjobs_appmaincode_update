// To parse this JSON data, do
//
//     final jobDetails = jobDetailsFromJson(jsonString);

// ignore_for_file: constant_identifier_names, unnecessary_new, unnecessary_null_comparison, prefer_conditional_assignment

import 'dart:convert';

JobDetails jobDetailsFromJson(String str) =>
    JobDetails.fromJson(json.decode(str));

String jobDetailsToJson(JobDetails data) => json.encode(data.toJson());

class JobDetails {
  JobDetails({
    this.posts,
    this.counts,
  });

  List<Post>? posts;
  int? counts;

  factory JobDetails.fromJson(Map<String, dynamic> json) => JobDetails(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        counts: json["counts"],
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
        "counts": counts,
      };
}

class Post {
  Post({
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
    this.wishlist,
  });

  String? id;
  String? userId;
  String? title;
  String? description;
  Experience? experience;
  int? maxPositions;
  int? activeApplications;
  int? acceptedCandidates;
  DateTime? dateOfPosting;
  String? postedAt;
  DateTime? deadline;
  List<String>? skillsets;
  List<String>? cities;
  JobType? jobType;
  Country? country;
  String? education;
  dynamic? salary;
  int? rating;
  int? v;
  Recruiter? recruiter;
  bool? wishlist;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        experience: experienceValues.map[json["experience"]],
        maxPositions: json["maxPositions"],
        activeApplications: json["activeApplications"],
        acceptedCandidates: json["acceptedCandidates"],
        dateOfPosting: DateTime.parse(json["dateOfPosting"]),
        postedAt: json["postedAt"],
        deadline: DateTime.parse(json["deadline"]),
        skillsets: List<String>.from(json["skillsets"].map((x) => x)),
        cities: List<String>.from(json["cities"].map((x) => x)),
        jobType: jobTypeValues.map[json["jobType"]],
        country: countryValues.map[json["country"]],
        education: json["education"],
        salary: json["salary"],
        rating: json["rating"],
        v: json["__v"],
        recruiter: json["recruiter"] == null
            ? null
            : Recruiter.fromJson(json["recruiter"]),
        wishlist: json["wishlist"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "title": title,
        "description": description,
        "experience": experienceValues.reverse[experience],
        "maxPositions": maxPositions,
        "activeApplications": activeApplications,
        "acceptedCandidates": acceptedCandidates,
        "dateOfPosting": dateOfPosting!.toIso8601String(),
        "postedAt": postedAt,
        "deadline": deadline!.toIso8601String(),
        "skillsets": List<dynamic>.from(skillsets!.map((x) => x)),
        "cities": List<dynamic>.from(cities!.map((x) => x)),
        "jobType": jobTypeValues.reverse[jobType],
        "country": countryValues.reverse[country],
        "education": education,
        "salary": salary,
        "rating": rating,
        "__v": v,
        "recruiter": recruiter == null ? null : recruiter!.toJson(),
        "wishlist": wishlist,
      };
}

enum Country { INDIA, EMPTY }

final countryValues = EnumValues({"": Country.EMPTY, "India": Country.INDIA});

enum Experience { THE_25_YEARS, THE_02_YEARS, THE_510_YEARS, THE_1015_YEARS }

final experienceValues = EnumValues({
  "0-2 years": Experience.THE_02_YEARS,
  "10-15 years": Experience.THE_1015_YEARS,
  "2-5 years": Experience.THE_25_YEARS,
  "5-10 years": Experience.THE_510_YEARS
});

enum JobType { PART_TIME, FULL_TIME, FREELANCER }

final jobTypeValues = EnumValues({
  "freelancer": JobType.FREELANCER,
  "Full Time": JobType.FULL_TIME,
  "Part Time": JobType.PART_TIME
});

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
    this.v,
    this.profileImage,
    this.createdAt,
  });

  JobDescription? jobDescription;
  String? id;
  String? userId;
  String? companyname;
  Websitelink? websitelink;
  DateTime? foundedDate;
  String? organizationType;
  Country? country;
  int? contactNumber;
  String? description;
  String? email;
  State1? state;
  City? city;
  String? address;
  dynamic? pincode;
  String? facebook;
  String? twitter;
  String? google;
  String? linkedin;
  int? v;
  String? profileImage;
  DateTime? createdAt;

  factory Recruiter.fromJson(Map<String, dynamic> json) => Recruiter(
        jobDescription: JobDescription.fromJson(json["jobDescription"]),
        id: json["_id"],
        userId: json["userId"],
        companyname: json["companyname"],
        websitelink: websitelinkValues.map[json["websitelink"]],
        foundedDate: json["foundedDate"] == null
            ? null
            : DateTime.parse(json["foundedDate"]),
        organizationType: json["organizationType"],
        country: countryValues.map[json["country"]],
        contactNumber: json["contactNumber"],
        description: json["description"],
        email: json["email"],
        state: stateValues.map[json["state"]],
        city: cityValues.map[json["city"]],
        address: json["address"],
        pincode: json["pincode"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        google: json["google"],
        linkedin: json["linkedin"],
        v: json["__v"],
        profileImage: json["profileImage"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "jobDescription": jobDescription!.toJson(),
        "_id": id,
        "userId": userId,
        "companyname": companyname,
        "websitelink": websitelinkValues.reverse[websitelink],
        "foundedDate":
            foundedDate == null ? null : foundedDate!.toIso8601String(),
        "organizationType": organizationType,
        "country": countryValues.reverse[country],
        "contactNumber": contactNumber,
        "description": description,
        "email": email,
        "state": stateValues.reverse[state],
        "city": cityValues.reverse[city],
        "address": address,
        "pincode": pincode,
        "facebook": facebook,
        "twitter": twitter,
        "google": google,
        "linkedin": linkedin,
        "__v": v,
        "profileImage": profileImage,
        "createdAt": createdAt!.toIso8601String(),
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

enum City { EMPTY, HYDERABAD }

final cityValues = EnumValues({"": City.EMPTY, "Hyderabad": City.HYDERABAD});

enum State1 { ASSAM, EMPTY, TELANGANA }

final stateValues = EnumValues(
    {"Assam": State1.ASSAM, "": State1.EMPTY, "Telangana": State1.TELANGANA});

enum Websitelink { EMPTY, WWW_PERFEXTECHNOLOGIES_COM }

final websitelinkValues = EnumValues({
  "": Websitelink.EMPTY,
  "www.perfextechnologies.com": Websitelink.WWW_PERFEXTECHNOLOGIES_COM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
