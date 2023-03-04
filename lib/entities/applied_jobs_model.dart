// To parse this JSON data, do
//
//     final appliedJobs = appliedJobsFromJson(jsonString);

import 'dart:convert';

List<AppliedJobs> appliedJobsFromJson(String str) => List<AppliedJobs>.from(
    json.decode(str).map((x) => AppliedJobs.fromJson(x)));

String appliedJobsToJson(List<AppliedJobs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppliedJobs {
  AppliedJobs({
    this.id,
    this.userId,
    this.recruiterId,
    this.jobId,
    this.status,
    this.sop,
    this.dateOfApplication,
    this.v,
    this.jobApplicant,
    this.job,
    this.recruiter,
  });

  String? id;
  String? userId;
  String? recruiterId;
  String? jobId;
  String? status;
  String? sop;
  DateTime? dateOfApplication;
  int? v;
  JobApplicant? jobApplicant;
  Job? job;
  Recruiter? recruiter;

  factory AppliedJobs.fromJson(Map<String, dynamic> json) => AppliedJobs(
        id: json["_id"],
        userId: json["userId"],
        recruiterId: json["recruiterId"],
        jobId: json["jobId"],
        status: json["status"],
        sop: json["sop"],
        dateOfApplication: DateTime.parse(json["dateOfApplication"]),
        v: json["__v"],
        jobApplicant: json["jobApplicant"] == null
            ? null
            : JobApplicant.fromJson(json["jobApplicant"]),
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        recruiter: json["recruiter"] == null
            ? null
            : Recruiter.fromJson(json["recruiter"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "recruiterId": recruiterId,
        "jobId": jobId,
        "status": status,
        "sop": sop,
        "dateOfApplication": dateOfApplication!.toIso8601String(),
        "__v": v,
        "jobApplicant": jobApplicant == null ? null : jobApplicant!.toJson(),
        "job": job == null ? null : job!.toJson(),
        "recruiter": recruiter == null ? null : recruiter!.toJson(),
      };
}

class Job {
  Job({
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
  dynamic? salary;
  int? rating;
  int? v;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
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

class JobApplicant {
  JobApplicant({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.experience,
    this.state,
    this.totalExperience,
    this.currentlocation,
    this.resumeHeadline,
    this.profileSummary,
    this.skills,
    this.rating,
    this.resume,
    this.profile,
    this.personaldetails,
    this.contactNumber,
    this.isPhoneVerified,
    this.isEmailVerified,
    this.jobApplicantDate,
    this.employment,
    this.education,
    this.project,
    this.worksample,
    this.presentation,
    this.publication,
    this.patent,
    this.certification,
    this.careerprofile,
    this.v,
    this.profileImage,
  });

  String? id;
  String? userId;
  String? name;
  String? email;
  String? experience;
  String? state;
  String? totalExperience;
  List<dynamic>? currentlocation;
  String? resumeHeadline;
  String? profileSummary;
  List<dynamic>? skills;
  int? rating;
  Resume? resume;
  String? profile;
  Personaldetails? personaldetails;
  int? contactNumber;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  DateTime? jobApplicantDate;
  List<Employment>? employment;
  List<dynamic>? education;
  List<dynamic>? project;
  List<dynamic>? worksample;
  List<dynamic>? presentation;
  List<dynamic>? publication;
  List<dynamic>? patent;
  List<dynamic>? certification;
  List<dynamic>? careerprofile;
  int? v;
  String? profileImage;

  factory JobApplicant.fromJson(Map<String, dynamic> json) => JobApplicant(
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        experience: json["experience"],
        state: json["state"],
        totalExperience: json["total_experience"],
        currentlocation:
            List<dynamic>.from(json["currentlocation"].map((x) => x)),
        resumeHeadline: json["resumeHeadline"],
        profileSummary: json["profileSummary"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        rating: json["rating"],
        resume: json["resume"] == null ? null : Resume.fromJson(json["resume"]),
        profile: json["profile"],
        personaldetails: json["personaldetails"] == null
            ? null
            : Personaldetails.fromJson(json["personaldetails"]),
        contactNumber: json["contactNumber"],
        isPhoneVerified: json["isPhoneVerified"],
        isEmailVerified: json["isEmailVerified"],
        jobApplicantDate: DateTime.parse(json["jobApplicantDate"]),
        employment: List<Employment>.from(
            json["employment"].map((x) => Employment.fromJson(x))),
        education: List<dynamic>.from(json["education"].map((x) => x)),
        project: List<dynamic>.from(json["project"].map((x) => x)),
        worksample: List<dynamic>.from(json["worksample"].map((x) => x)),
        presentation: List<dynamic>.from(json["presentation"].map((x) => x)),
        publication: List<dynamic>.from(json["publication"].map((x) => x)),
        patent: List<dynamic>.from(json["patent"].map((x) => x)),
        certification: List<dynamic>.from(json["certification"].map((x) => x)),
        careerprofile: List<dynamic>.from(json["careerprofile"].map((x) => x)),
        v: json["__v"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "name": name,
        "email": email,
        "experience": experience,
        "state": state,
        "total_experience": totalExperience,
        "currentlocation": List<dynamic>.from(currentlocation!.map((x) => x)),
        "resumeHeadline": resumeHeadline,
        "profileSummary": profileSummary,
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "rating": rating,
        "resume": resume == null ? null : resume!.toJson(),
        "profile": profile,
        "personaldetails":
            personaldetails == null ? null : personaldetails!.toJson(),
        "contactNumber": contactNumber,
        "isPhoneVerified": isPhoneVerified,
        "isEmailVerified": isEmailVerified,
        "jobApplicantDate": jobApplicantDate!.toIso8601String(),
        "employment": List<dynamic>.from(employment!.map((x) => x.toJson())),
        "education": List<dynamic>.from(education!.map((x) => x)),
        "project": List<dynamic>.from(project!.map((x) => x)),
        "worksample": List<dynamic>.from(worksample!.map((x) => x)),
        "presentation": List<dynamic>.from(presentation!.map((x) => x)),
        "publication": List<dynamic>.from(publication!.map((x) => x)),
        "patent": List<dynamic>.from(patent!.map((x) => x)),
        "certification": List<dynamic>.from(certification!.map((x) => x)),
        "careerprofile": List<dynamic>.from(careerprofile!.map((x) => x)),
        "__v": v,
        "profileImage": profileImage,
      };
}

class Employment {
  Employment({
    this.years,
    this.isCurrentCompany,
    this.noticePeriod,
    this.months,
    this.currentCtc,
    this.designation,
    this.organization,
    this.startYear,
    this.endYear,
    this.profileDescription,
    this.offerLetterName,
    this.expLetterName,
    this.salaryslipName,
    this.bankStatementName,
    this.id,
  });

  String? years;
  String? isCurrentCompany;
  String? noticePeriod;
  String? months;
  String? currentCtc;
  List<dynamic>? designation;
  List<dynamic>? organization;
  DateTime? startYear;
  DateTime? endYear;
  String? profileDescription;
  String? offerLetterName;
  String? expLetterName;
  String? salaryslipName;
  String? bankStatementName;
  String? id;

  factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        years: json["years"],
        isCurrentCompany: json["isCurrentCompany"],
        noticePeriod: json["noticePeriod"],
        months: json["months"],
        currentCtc: json["CurrentCTC"],
        designation: List<dynamic>.from(json["designation"].map((x) => x)),
        organization: List<dynamic>.from(json["organization"].map((x) => x)),
        // startYear: DateTime.parse(json["startYear"]),
        endYear: DateTime.parse(json["endYear"]),
        profileDescription: json["profileDescription"],
        offerLetterName: json["offerLetterName"],
        expLetterName: json["expLetterName"],
        salaryslipName: json["salaryslipName"],
        bankStatementName: json["BankStatementName"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "years": years,
        "isCurrentCompany": isCurrentCompany,
        "noticePeriod": noticePeriod,
        "months": months,
        "CurrentCTC": currentCtc,
        "designation": List<dynamic>.from(designation!.map((x) => x)),
        "organization": List<dynamic>.from(organization!.map((x) => x)),
        "startYear": startYear!.toIso8601String(),
        "endYear": endYear!.toIso8601String(),
        "profileDescription": profileDescription,
        "offerLetterName": offerLetterName,
        "expLetterName": expLetterName,
        "salaryslipName": salaryslipName,
        "BankStatementName": bankStatementName,
        "_id": id,
      };
}

class Personaldetails {
  Personaldetails({
    this.dateofbirth,
    this.age,
    this.address,
    this.gender,
    this.pincode,
    this.maritalStatus,
    this.hometown,
    this.addressProof,
    this.adressProofNumber,
    this.passport,
    this.margaccount,
    this.personaldetailsAge,
    this.languages,
  });

  dynamic? dateofbirth;
  dynamic? age;
  String? address;
  String? gender;
  dynamic? pincode;
  String? maritalStatus;
  String? hometown;
  String? addressProof;
  String? adressProofNumber;
  String? passport;
  String? margaccount;
  dynamic? personaldetailsAge;
  List<dynamic>? languages;

  factory Personaldetails.fromJson(Map<String, dynamic> json) =>
      Personaldetails(
        dateofbirth: json["dateofbirth"],
        age: json["Age"],
        address: json["address"],
        gender: json["gender"],
        pincode: json["pincode"],
        maritalStatus: json["maritalStatus"],
        hometown: json["hometown"],
        addressProof: json["AddressProof"],
        adressProofNumber: json["AdressProofNumber"],
        passport: json["passport"],
        margaccount: json["margaccount"],
        personaldetailsAge: json["age"],
        languages: List<dynamic>.from(json["languages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "dateofbirth": dateofbirth,
        "Age": age,
        "address": address,
        "gender": gender,
        "pincode": pincode,
        "maritalStatus": maritalStatus,
        "hometown": hometown,
        "AddressProof": addressProof,
        "AdressProofNumber": adressProofNumber,
        "passport": passport,
        "margaccount": margaccount,
        "age": personaldetailsAge,
        "languages": List<dynamic>.from(languages!.map((x) => x)),
      };
}

class Resume {
  Resume();

  factory Resume.fromJson(Map<String, dynamic> json) => Resume();

  Map<String, dynamic> toJson() => {};
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
    this.profileImage,
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
  String? profileImage;

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
        profileImage:
            json["profileImage"] == null ? null : json["profileImage"],
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
        "profileImage": profileImage == null ? null : profileImage,
      };
}
