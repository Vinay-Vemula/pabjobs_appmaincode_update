// To parse this JSON data, do
//
//     final candidateDetailsModel = candidateDetailsModelFromJson(jsonString);

import 'dart:convert';

CandidateDetailsModel candidateDetailsModelFromJson(String str) =>
    CandidateDetailsModel.fromJson(json.decode(str));

String candidateDetailsModelToJson(CandidateDetailsModel data) =>
    json.encode(data.toJson());

class CandidateDetailsModel {
  CandidateDetailsModel({
    this.posts,
    this.listOfStudents,
    this.counts,
  });

  List<Post>? posts;
  int? listOfStudents;
  int? counts;

  factory CandidateDetailsModel.fromJson(Map<String, dynamic> json) =>
      CandidateDetailsModel(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        listOfStudents: json["listOfStudents"],
        counts: json["counts"],
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
        "listOfStudents": listOfStudents,
        "counts": counts,
      };
}

class Post {
  Post({
    this.resume,
    this.personaldetails,
    this.resumeHeadline,
    this.profileSummary,
    this.id,
    this.userId,
    this.name,
    this.email,
    this.experience,
    this.lastname,
    this.qualification,
    this.yop,
    this.locality,
    this.state,
    this.percentage,
    this.collegename,
    this.totalExperience,
    this.currentlocation,
    this.skills,
    this.rating,
    this.profile,
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
    this.contactOtp,
  });

  Resume? resume;
  Personaldetails? personaldetails;
  String? resumeHeadline;
  String? profileSummary;
  String? id;
  String? userId;
  String? name;
  String? email;
  String? experience;
  String? lastname;
  String? qualification;
  String? yop;
  String? locality;
  String? state;
  String? percentage;
  String? collegename;
  TotalExperience? totalExperience;
  List<String>? currentlocation;
  List<String>? skills;
  int? rating;
  String? profile;
  int? contactNumber;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  DateTime? jobApplicantDate;
  List<Employment?>? employment;
  List<Education?>? education;
  List<Project?>? project;
  List<dynamic>? worksample;
  List<dynamic>? presentation;
  List<dynamic>? publication;
  List<dynamic>? patent;
  List<dynamic>? certification;
  List<Careerprofile?>? careerprofile;
  int? v;
  String? profileImage;
  int? contactOtp;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        resume: Resume.fromJson(json["resume"]),
        personaldetails: Personaldetails.fromJson(json["personaldetails"]),
        resumeHeadline: json["resumeHeadline"],
        profileSummary: json["profileSummary"],
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        experience: json["experience"],
        lastname: json["lastname"],
        qualification: json["qualification"],
        yop: json["yop"],
        locality: json["locality"],
        state: json["state"],
        percentage: json["percentage"],
        collegename: json["collegename"],
        totalExperience: totalExperienceValues.map![json["total_experience"]],
        currentlocation:
            List<String>.from(json["currentlocation"].map((x) => x)),
        skills: List<String>.from(json["skills"].map((x) => x)),
        rating: json["rating"],
        profile: json["profile"],
        contactNumber: json["contactNumber"],
        isPhoneVerified: json["isPhoneVerified"],
        isEmailVerified: json["isEmailVerified"],
        jobApplicantDate: DateTime.parse(json["jobApplicantDate"]),
        employment: List<Employment?>.from(
            json["employment"].map((x) => Employment.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        project:
            List<Project>.from(json["project"].map((x) => Project.fromJson(x))),
        worksample: List<dynamic>.from(json["worksample"].map((x) => x)),
        presentation: List<dynamic>.from(json["presentation"].map((x) => x)),
        publication: List<dynamic>.from(json["publication"].map((x) => x)),
        patent: List<dynamic>.from(json["patent"].map((x) => x)),
        certification: List<dynamic>.from(json["certification"].map((x) => x)),
        careerprofile: List<Careerprofile>.from(
            json["careerprofile"].map((x) => Careerprofile.fromJson(x))),
        v: json["__v"],
        profileImage:
            json["profileImage"] == null ? null : json["profileImage"],
        contactOtp: json["contactOtp"] == null ? null : json["contactOtp"],
      );

  Map<String, dynamic> toJson() => {
        "resume": resume!.toJson(),
        "personaldetails": personaldetails!.toJson(),
        "resumeHeadline": resumeHeadline,
        "profileSummary": profileSummary,
        "_id": id,
        "userId": userId,
        "name": name,
        "email": email,
        "experience": experience,
        "lastname": lastname,
        "qualification": qualification,
        "yop": yop,
        "locality": locality,
        "state": state,
        "percentage": percentage,
        "collegename": collegename,
        "total_experience": totalExperienceValues.reverse[totalExperience],
        "currentlocation": List<dynamic>.from(currentlocation!.map((x) => x)),
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "rating": rating,
        "profile": profile,
        "contactNumber": contactNumber,
        "isPhoneVerified": isPhoneVerified,
        "isEmailVerified": isEmailVerified,
        "jobApplicantDate": jobApplicantDate!.toIso8601String(),
        "employment": List<dynamic>.from(employment!.map((x) => x!.toJson())),
        "education": List<dynamic>.from(education!.map((x) => x!.toJson())),
        "project": List<dynamic>.from(project!.map((x) => x!.toJson())),
        "worksample": List<dynamic>.from(worksample!.map((x) => x)),
        "presentation": List<dynamic>.from(presentation!.map((x) => x)),
        "publication": List<dynamic>.from(publication!.map((x) => x)),
        "patent": List<dynamic>.from(patent!.map((x) => x)),
        "certification": List<dynamic>.from(certification!.map((x) => x)),
        "careerprofile":
            List<dynamic>.from(careerprofile!.map((x) => x!.toJson())),
        "__v": v,
        "profileImage": profileImage == null ? null : profileImage,
        "contactOtp": contactOtp == null ? null : contactOtp,
      };
}

class Careerprofile {
  Careerprofile({
    this.careerIndustry,
    this.desiredFunctionalAreaDepartment,
    this.desiredRoleUrl,
    this.desiredJobType,
    this.desiredEmployementType,
    this.desiredPrefferedShift,
    this.desiredAvailableJoinYears,
    this.desiredAvailableJoinMonths,
    this.desiredExpectedSalaryinLakhs,
    this.desiredExpectedSalaryinThousands,
    this.desiredLocation,
    this.desiredIndustry,
    this.id,
  });

  String? careerIndustry;
  String? desiredFunctionalAreaDepartment;
  String? desiredRoleUrl;
  String? desiredJobType;
  String? desiredEmployementType;
  String? desiredPrefferedShift;
  String? desiredAvailableJoinYears;
  String? desiredAvailableJoinMonths;
  String? desiredExpectedSalaryinLakhs;
  String? desiredExpectedSalaryinThousands;
  List<String?>? desiredLocation;
  String? desiredIndustry;
  String? id;

  factory Careerprofile.fromJson(Map<String, dynamic> json) => Careerprofile(
        careerIndustry: json["career_Industry"],
        desiredFunctionalAreaDepartment:
            json["Desired_Functional_Area_Department"],
        desiredRoleUrl: json["Desired_Role_URL"],
        desiredJobType: json["Desired_Job_Type"],
        desiredEmployementType: json["Desired_Employement_Type"],
        desiredPrefferedShift: json["Desired_PrefferedShift"],
        desiredAvailableJoinYears: json["Desired_AvailableJoinYears"],
        desiredAvailableJoinMonths: json["Desired_AvailableJoinMonths"],
        desiredExpectedSalaryinLakhs: json["Desired_Expected_SalaryinLakhs"],
        desiredExpectedSalaryinThousands:
            json["Desired_Expected_SalaryinThousands"],
        desiredLocation:
            List<String>.from(json["Desired_Location"].map((x) => x)),
        desiredIndustry: json["Desired_Industry"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "career_Industry": careerIndustry,
        "Desired_Functional_Area_Department": desiredFunctionalAreaDepartment,
        "Desired_Role_URL": desiredRoleUrl,
        "Desired_Job_Type": desiredJobType,
        "Desired_Employement_Type": desiredEmployementType,
        "Desired_PrefferedShift": desiredPrefferedShift,
        "Desired_AvailableJoinYears": desiredAvailableJoinYears,
        "Desired_AvailableJoinMonths": desiredAvailableJoinMonths,
        "Desired_Expected_SalaryinLakhs": desiredExpectedSalaryinLakhs,
        "Desired_Expected_SalaryinThousands": desiredExpectedSalaryinThousands,
        "Desired_Location": List<dynamic>.from(desiredLocation!.map((x) => x)),
        "Desired_Industry": desiredIndustry,
        "_id": id,
      };
}

class Education {
  Education({
    this.highestgraduation,
    this.course,
    this.specialization,
    this.institute,
    this.passedoutyear,
    this.courseType,
    this.marks,
    this.id,
  });

  String? highestgraduation;
  String? course;
  String? specialization;
  String? institute;
  int? passedoutyear;
  String? courseType;
  double? marks;
  String? id;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        highestgraduation: json["highestgraduation"],
        course: json["course"],
        specialization: json["specialization"],
        institute: json["institute"],
        passedoutyear:
            json["passedoutyear"] == null ? null : json["passedoutyear"],
        courseType: json["courseType"],
        marks: json["marks"] == null ? null : json["marks"].toDouble(),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "highestgraduation": highestgraduation,
        "course": course,
        "specialization": specialization,
        "institute": institute,
        "passedoutyear": passedoutyear == null ? null : passedoutyear,
        "courseType": courseType,
        "marks": marks == null ? null : marks,
        "_id": id,
      };
}

class Employment {
  Employment({
    this.years,
    this.isCurrentCompany,
    this.noticePeriod,
    this.months,
    this.designation,
    this.organization,
    // this.startYear,
    // this.endYear,
    this.profileDescription,
    this.offerLetter,
    this.expLetter,
    this.salaryslip,
    this.bankStatement,
    this.offerLetterName,
    this.expLetterName,
    this.salaryslipName,
    this.bankStatementName,
    this.currentCtc,
    this.id,
  });

  TotalExperience? years;
  Passport? isCurrentCompany;
  NoticePeriod? noticePeriod;
  String? months;
  List<Designation?>? designation;
  List<String?>? organization;
  // DateTime? startYear;
  // DateTime? endYear;
  String? profileDescription;
  String? offerLetter;
  ExpLetter? expLetter;
  String? salaryslip;
  String? bankStatement;
  ExpLetter? offerLetterName;
  ExpLetter? expLetterName;
  SalaryslipName? salaryslipName;
  BankStatementName? bankStatementName;
  CurrentCtc? currentCtc;
  String? id;

  factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        years: totalExperienceValues.map![json["years"]],
        isCurrentCompany: passportValues.map![json["isCurrentCompany"]],
        noticePeriod: noticePeriodValues.map![json["noticePeriod"]],
        months: json["months"],
        designation: json["designation"] == null
            ? null
            : List<Designation?>.from(
                json["designation"].map((x) => designationValues.map![x])),
        organization: List<String>.from(json["organization"].map((x) => x)),
        // startYear: json["startYear"] == null
        //     ? null
        //     : DateTime.parse(json["startYear"]),
        // endYear: DateTime.parse(json["endYear"]),
        profileDescription: json["profileDescription"],
        offerLetter: json["offerLetter"],
        expLetter: expLetterValues.map![json["expLetter"]],
        salaryslip: json["salaryslip"],
        bankStatement: json["BankStatement"],
        offerLetterName: expLetterValues.map![json["offerLetterName"]],
        expLetterName: expLetterValues.map![json["expLetterName"]],
        salaryslipName: salaryslipNameValues.map![json["salaryslipName"]],
        bankStatementName:
            bankStatementNameValues.map![json["BankStatementName"]],
        currentCtc: currentCtcValues.map![json["CurrentCTC"]],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "years": totalExperienceValues.reverse[years],
        "isCurrentCompany": passportValues.reverse[isCurrentCompany],
        "noticePeriod": noticePeriodValues.reverse[noticePeriod],
        "months": months,
        "designation": designation == null
            ? null
            : List<dynamic>.from(
                designation!.map((x) => designationValues.reverse[x])),
        "organization": List<dynamic>.from(organization!.map((x) => x)),
        // "startYear": startYear == null ? null : startYear!.toIso8601String(),
        // "endYear": endYear!.toIso8601String(),
        "profileDescription": profileDescription,
        "offerLetter": offerLetter,
        "expLetter": expLetterValues.reverse[expLetter],
        "salaryslip": salaryslip,
        "BankStatement": bankStatement,
        "offerLetterName": expLetterValues.reverse[offerLetterName],
        "expLetterName": expLetterValues.reverse[expLetterName],
        "salaryslipName": salaryslipNameValues.reverse[salaryslipName],
        "BankStatementName": bankStatementNameValues.reverse[bankStatementName],
        "CurrentCTC": currentCtcValues.reverse[currentCtc],
        "_id": id,
      };
}

enum BankStatementName { EMPTY, DURGA_RESUME_PDF }

final bankStatementNameValues = EnumValues({
  "durga resume.pdf": BankStatementName.DURGA_RESUME_PDF,
  "": BankStatementName.EMPTY
});

enum CurrentCtc { EMPTY, THE_03_LPA, THE_35_LPA }

final currentCtcValues = EnumValues({
  "": CurrentCtc.EMPTY,
  "0-3 LPA": CurrentCtc.THE_03_LPA,
  "3-5 LPA": CurrentCtc.THE_35_LPA
});

enum Designation { ABAP_CONSULTANT, JUNIOR_SOFTWARE_DEVELOPER }

final designationValues = EnumValues({
  "ABAP Consultant": Designation.ABAP_CONSULTANT,
  "Junior Software Developer": Designation.JUNIOR_SOFTWARE_DEVELOPER
});

enum ExpLetter { EMPTY, VARA_PRASAD_RESUME02_2_PDF }

final expLetterValues = EnumValues({
  "": ExpLetter.EMPTY,
  "vara prasad resume02 (2).pdf": ExpLetter.VARA_PRASAD_RESUME02_2_PDF
});

enum Passport { NO, YES, EMPTY }

final passportValues =
    EnumValues({"": Passport.EMPTY, "No": Passport.NO, "Yes": Passport.YES});

enum NoticePeriod { EMPTY, SERVING_NOTICE_PERIOD }

final noticePeriodValues = EnumValues({
  "": NoticePeriod.EMPTY,
  "Serving Notice Period": NoticePeriod.SERVING_NOTICE_PERIOD
});

enum SalaryslipName { EMPTY, DORABABU_PDF }

final salaryslipNameValues = EnumValues(
    {"Dorababu.pdf": SalaryslipName.DORABABU_PDF, "": SalaryslipName.EMPTY});

enum TotalExperience { EMPTY, THE_02_YEARS, THE_25_YEARS, THE_710_YEARS }

final totalExperienceValues = EnumValues({
  "": TotalExperience.EMPTY,
  "0-2 Years": TotalExperience.THE_02_YEARS,
  "2-5 Years": TotalExperience.THE_25_YEARS,
  "7-10 Years": TotalExperience.THE_710_YEARS
});

class Personaldetails {
  Personaldetails({
    this.dateofbirth,
    this.address,
    this.gender,
    this.pincode,
    this.maritalStatus,
    this.hometown,
    this.addressProof,
    this.adressProofNumber,
    this.passport,
    this.margaccount,
    this.age,
    this.languages,
  });

  DateTime? dateofbirth;
  String? address;
  String? gender;
  int? pincode;
  String? maritalStatus;
  String? hometown;
  String? addressProof;
  String? adressProofNumber;
  Passport? passport;
  String? margaccount;
  int? age;
  List<String?>? languages;

  factory Personaldetails.fromJson(Map<String, dynamic> json) =>
      Personaldetails(
        dateofbirth: json["dateofbirth"] == null
            ? null
            : DateTime.parse(json["dateofbirth"]),
        address: json["address"],
        gender: json["gender"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        maritalStatus: json["maritalStatus"],
        hometown: json["hometown"],
        addressProof: json["AddressProof"],
        adressProofNumber: json["AdressProofNumber"],
        passport: passportValues.map![json["passport"]],
        margaccount: json["margaccount"],
        age: json["age"] == null ? null : json["age"],
        languages: List<String>.from(json["languages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "dateofbirth":
            dateofbirth == null ? null : dateofbirth!.toIso8601String(),
        "address": address,
        "gender": gender,
        "pincode": pincode == null ? null : pincode,
        "maritalStatus": maritalStatus,
        "hometown": hometown,
        "AddressProof": addressProof,
        "AdressProofNumber": adressProofNumber,
        "passport": passportValues.reverse[passport],
        "margaccount": margaccount,
        "age": age == null ? null : age,
        "languages": List<dynamic>.from(languages!.map((x) => x)),
      };
}

class Project {
  Project({
    this.projectTitle,
    this.projectClient,
    this.projectDescription,
    this.projectStartDate,
    this.projectWorkTill,
    this.id,
  });

  String? projectTitle;
  String? projectClient;
  String? projectDescription;
  DateTime? projectStartDate;
  DateTime? projectWorkTill;
  String? id;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        projectTitle: json["ProjectTitle"],
        projectClient: json["ProjectClient"],
        projectDescription: json["ProjectDescription"],
        projectStartDate: json["ProjectStartDate"] == null
            ? null
            : DateTime.parse(json["ProjectStartDate"]),
        projectWorkTill: json["ProjectWorkTill"] == null
            ? null
            : DateTime.parse(json["ProjectWorkTill"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "ProjectTitle": projectTitle,
        "ProjectClient": projectClient,
        "ProjectDescription": projectDescription,
        "ProjectStartDate": projectStartDate == null
            ? null
            : projectStartDate!.toIso8601String(),
        "ProjectWorkTill":
            projectWorkTill == null ? null : projectWorkTill!.toIso8601String(),
        "_id": id,
      };
}

class Resume {
  Resume({
    this.filename,
    this.url,
  });

  String? filename;
  String? url;

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
        filename: json["filename"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "url": url,
      };
}

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
