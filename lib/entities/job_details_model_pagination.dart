// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.posts,
  });

  List<Post1>? posts;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        posts: List<Post1>.from(json["posts"].map((x) => Post1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Post1 {
  Post1({
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
  dynamic salary;
  int? rating;
  int? v;
  Recruiter1? recruiter;
  bool? wishlist;

  factory Post1.fromJson(Map<String, dynamic> json) => Post1(
        id: json["_id"],
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        experience: experienceValues.map![json["experience"]],
        maxPositions: json["maxPositions"],
        activeApplications: json["activeApplications"],
        acceptedCandidates: json["acceptedCandidates"],
        dateOfPosting: DateTime.parse(json["dateOfPosting"]),
        postedAt: json["postedAt"],
        deadline: DateTime.parse(json["deadline"]),
        skillsets: List<String>.from(json["skillsets"].map((x) => x)),
        cities: List<String>.from(json["cities"].map((x) => x)),
        jobType: jobTypeValues.map![json["jobType"]],
        country: countryValues.map![json["country"]],
        education: json["education"],
        salary: json["salary"],
        rating: json["rating"],
        v: json["__v"],
        recruiter: json["recruiter"] == null
            ? null
            : Recruiter1.fromJson(json["recruiter"]),
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

enum Experience { THE_02_YEARS, THE_15_YEARS, THE_25_YEARS }

final experienceValues = EnumValues({
  "0-2 years": Experience.THE_02_YEARS,
  "15+ years": Experience.THE_15_YEARS,
  "2-5 years": Experience.THE_25_YEARS
});

enum JobType { FULL_TIME, PART_TIME, JOB_TYPE_PART_TIME }

final jobTypeValues = EnumValues({
  "Full Time": JobType.FULL_TIME,
  "part time": JobType.JOB_TYPE_PART_TIME,
  "Part Time": JobType.PART_TIME
});

class Recruiter1 {
  Recruiter1({
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
  Websitelink? websitelink;
  DateTime? foundedDate;
  String? organizationType;
  Country? country;
  int? contactNumber;
  String? description;
  String? email;
  String? state;
  City? city;
  String? address;
  int? pincode;
  Facebook? facebook;
  Twitter? twitter;
  Google? google;
  Linkedin? linkedin;
  DateTime? createdAt;
  String? subscription;
  List<dynamic>? subscriptionDetails;
  List<dynamic>? hrData;
  int? v;
  String? profileImage;

  factory Recruiter1.fromJson(Map<String, dynamic> json) => Recruiter1(
        jobDescription: JobDescription.fromJson(json["jobDescription"]),
        id: json["_id"],
        userId: json["userId"],
        companyname: json["companyname"],
        websitelink: websitelinkValues.map![json["websitelink"]],
        foundedDate: json["foundedDate"] == null
            ? null
            : DateTime.parse(json["foundedDate"]),
        organizationType: json["organizationType"],
        country: countryValues.map![json["country"]],
        contactNumber: json["contactNumber"],
        description: json["description"],
        email: json["email"],
        state: json["state"],
        city: cityValues.map![json["city"]],
        address: json["address"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        facebook: facebookValues.map![json["facebook"]],
        twitter: twitterValues.map![json["twitter"]],
        google: googleValues.map![json["google"]],
        linkedin: linkedinValues.map![json["linkedin"]],
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
        "websitelink": websitelinkValues.reverse[websitelink],
        "foundedDate":
            foundedDate == null ? null : foundedDate!.toIso8601String(),
        "organizationType": organizationType,
        "country": countryValues.reverse[country],
        "contactNumber": contactNumber,
        "description": description,
        "email": email,
        "state": state,
        "city": cityValues.reverse[city],
        "address": address,
        "pincode": pincode == null ? null : pincode,
        "facebook": facebookValues.reverse[facebook],
        "twitter": twitterValues.reverse[twitter],
        "google": googleValues.reverse[google],
        "linkedin": linkedinValues.reverse[linkedin],
        "createdAt": createdAt!.toIso8601String(),
        "subscription": subscription,
        "subscriptionDetails":
            List<dynamic>.from(subscriptionDetails!.map((x) => x)),
        "hrData": List<dynamic>.from(hrData!.map((x) => x)),
        "__v": v,
        "profileImage": profileImage == null ? null : profileImage,
      };
}

enum City { ALIGARH, HYDERABAD, GUNTUR }

final cityValues = EnumValues({
  "Aligarh": City.ALIGARH,
  "Guntur": City.GUNTUR,
  "hyderabad": City.HYDERABAD
});

enum Facebook { FACEBOOK_COM, EMPTY }

final facebookValues =
    EnumValues({"": Facebook.EMPTY, "facebook.com": Facebook.FACEBOOK_COM});

enum Google { GOOGLE_COM, EMPTY }

final googleValues =
    EnumValues({"": Google.EMPTY, "google.com": Google.GOOGLE_COM});

class JobDescription {
  JobDescription({
    this.filename,
    this.url,
  });

  Filename? filename;
  Url? url;

  factory JobDescription.fromJson(Map<String, dynamic> json) => JobDescription(
        filename: filenameValues.map![json["filename"]],
        url: urlValues.map![json["url"]],
      );

  Map<String, dynamic> toJson() => {
        "filename": filenameValues.reverse[filename],
        "url": urlValues.reverse[url],
      };
}

enum Filename { EMPTY, AAAA }

final filenameValues = EnumValues({"aaaa": Filename.AAAA, "": Filename.EMPTY});

enum Url { EMPTY, ADDDDDDDDDDD }

final urlValues = EnumValues({"addddddddddd": Url.ADDDDDDDDDDD, "": Url.EMPTY});

enum Linkedin { LINKED_IN_COM, EMPTY }

final linkedinValues =
    EnumValues({"": Linkedin.EMPTY, "linked-in.com": Linkedin.LINKED_IN_COM});

enum Twitter { TWITTER_COM, EMPTY }

final twitterValues =
    EnumValues({"": Twitter.EMPTY, "twitter.com": Twitter.TWITTER_COM});

enum Websitelink { WWW_ARAKKALTRADING_FAKE_COM, WWW_ABBINENIBUSINESS_IN, EMPTY }

final websitelinkValues = EnumValues({
  "": Websitelink.EMPTY,
  "www.abbinenibusiness.in": Websitelink.WWW_ABBINENIBUSINESS_IN,
  "www.arakkaltrading.fake.com": Websitelink.WWW_ARAKKALTRADING_FAKE_COM
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
