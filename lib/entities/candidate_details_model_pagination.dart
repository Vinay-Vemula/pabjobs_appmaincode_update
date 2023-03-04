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
    this.resume,
    this.personaldetails,
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
    this.resumeHeadline,
    this.profileSummary,
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
  });

  Resume? resume;
  Personaldetails? personaldetails;
  String? id;
  String? userId;
  String? name;
  String? email;
  Experience? experience;
  Lastname? lastname;
  String? qualification;
  String? yop;
  String? locality;
  State1? state;
  String? percentage;
  Collegename? collegename;
  TotalExperience? totalExperience;
  List<String>? currentlocation;
  String? resumeHeadline;
  String? profileSummary;
  List<String?>? skills;
  int? rating;
  String? profile;
  int? contactNumber;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  DateTime? jobApplicantDate;
  List<Employment>? employment;
  List<Education>? education;
  List<dynamic>? project;
  List<dynamic>? worksample;
  List<dynamic>? presentation;
  List<dynamic>? publication;
  List<dynamic>? patent;
  List<dynamic>? certification;
  List<Careerprofile>? careerprofile;
  int? v;
  String? profileImage;

  factory Post1.fromJson(Map<String, dynamic> json) => Post1(
        resume: Resume.fromJson(json["resume"]),
        personaldetails: Personaldetails.fromJson(json["personaldetails"]),
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        experience: experienceValues.map![json["experience"]],
        lastname: lastnameValues.map![json["lastname"]],
        qualification: json["qualification"],
        yop: json["yop"],
        locality: json["locality"],
        state: stateValues.map![json["state"]],
        percentage: json["percentage"],
        collegename: collegenameValues.map![json["collegename"]],
        totalExperience: totalExperienceValues.map![json["total_experience"]],
        currentlocation:
            List<String>.from(json["currentlocation"].map((x) => x)),
        resumeHeadline: json["resumeHeadline"],
        profileSummary: json["profileSummary"],
        skills: json["skills"] == null
            ? null
            : List<String?>.from(json["skills"].map((x) => x)),
        rating: json["rating"],
        profile: json["profile"],
        contactNumber: json["contactNumber"],
        isPhoneVerified: json["isPhoneVerified"],
        isEmailVerified: json["isEmailVerified"],
        jobApplicantDate: DateTime.parse(json["jobApplicantDate"]),
        employment: List<Employment>.from(
            json["employment"].map((x) => Employment.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        project: List<dynamic>.from(json["project"].map((x) => x)),
        worksample: List<dynamic>.from(json["worksample"].map((x) => x)),
        presentation: List<dynamic>.from(json["presentation"].map((x) => x)),
        publication: List<dynamic>.from(json["publication"].map((x) => x)),
        patent: List<dynamic>.from(json["patent"].map((x) => x)),
        certification: List<dynamic>.from(json["certification"].map((x) => x)),
        careerprofile: json["careerprofile"] == null
            ? null
            : List<Careerprofile>.from(
                json["careerprofile"].map((x) => Careerprofile.fromJson(x))),
        v: json["__v"],
        profileImage:
            json["profileImage"] == null ? null : json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "resume": resume!.toJson(),
        "personaldetails": personaldetails!.toJson(),
        "_id": id,
        "userId": userId,
        "name": name,
        "email": email,
        "experience": experienceValues.reverse[experience],
        "lastname": lastnameValues.reverse[lastname],
        "qualification": qualification,
        "yop": yop,
        "locality": locality,
        "state": stateValues.reverse[state],
        "percentage": percentage,
        "collegename": collegenameValues.reverse[collegename],
        "total_experience": totalExperienceValues.reverse[totalExperience],
        "currentlocation": List<dynamic>.from(currentlocation!.map((x) => x)),
        "resumeHeadline": resumeHeadline,
        "profileSummary": profileSummary,
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "rating": rating,
        "profile": profile,
        "contactNumber": contactNumber,
        "isPhoneVerified": isPhoneVerified,
        "isEmailVerified": isEmailVerified,
        "jobApplicantDate": jobApplicantDate!.toIso8601String(),
        "employment": List<dynamic>.from(employment!.map((x) => x.toJson())),
        "education": List<dynamic>.from(education!.map((x) => x.toJson())),
        "project": List<dynamic>.from(project!.map((x) => x)),
        "worksample": List<dynamic>.from(worksample!.map((x) => x)),
        "presentation": List<dynamic>.from(presentation!.map((x) => x)),
        "publication": List<dynamic>.from(publication!.map((x) => x)),
        "patent": List<dynamic>.from(patent!.map((x) => x)),
        "certification": List<dynamic>.from(certification!.map((x) => x)),
        "careerprofile": careerprofile == null
            ? null
            : List<dynamic>.from(careerprofile!.map((x) => x.toJson())),
        "__v": v,
        "profileImage": profileImage == null ? null : profileImage,
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
  DesiredJobType? desiredJobType;
  Type? desiredEmployementType;
  DesiredPrefferedShift? desiredPrefferedShift;
  String? desiredAvailableJoinYears;
  String? desiredAvailableJoinMonths;
  String? desiredExpectedSalaryinLakhs;
  String? desiredExpectedSalaryinThousands;
  List<DesiredLocation?>? desiredLocation;
  String? desiredIndustry;
  String? id;

  factory Careerprofile.fromJson(Map<String, dynamic> json) => Careerprofile(
        careerIndustry: json["career_Industry"],
        desiredFunctionalAreaDepartment:
            json["Desired_Functional_Area_Department"],
        desiredRoleUrl: json["Desired_Role_URL"],
        desiredJobType: desiredJobTypeValues.map![json["Desired_Job_Type"]],
        desiredEmployementType:
            typeValues.map![json["Desired_Employement_Type"]],
        desiredPrefferedShift:
            desiredPrefferedShiftValues.map![json["Desired_PrefferedShift"]],
        desiredAvailableJoinYears: json["Desired_AvailableJoinYears"],
        desiredAvailableJoinMonths: json["Desired_AvailableJoinMonths"],
        desiredExpectedSalaryinLakhs: json["Desired_Expected_SalaryinLakhs"],
        desiredExpectedSalaryinThousands:
            json["Desired_Expected_SalaryinThousands"],
        desiredLocation: json["Desired_Location"] == null
            ? null
            : List<DesiredLocation?>.from(json["Desired_Location"]
                .map((x) => desiredLocationValues.map![x])),
        desiredIndustry: json["Desired_Industry"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "career_Industry": careerIndustry,
        "Desired_Functional_Area_Department": desiredFunctionalAreaDepartment,
        "Desired_Role_URL": desiredRoleUrl,
        "Desired_Job_Type": desiredJobTypeValues.reverse[desiredJobType],
        "Desired_Employement_Type": typeValues.reverse[desiredEmployementType],
        "Desired_PrefferedShift":
            desiredPrefferedShiftValues.reverse[desiredPrefferedShift],
        "Desired_AvailableJoinYears": desiredAvailableJoinYears,
        "Desired_AvailableJoinMonths": desiredAvailableJoinMonths,
        "Desired_Expected_SalaryinLakhs": desiredExpectedSalaryinLakhs,
        "Desired_Expected_SalaryinThousands": desiredExpectedSalaryinThousands,
        "Desired_Location": desiredLocation == null
            ? null
            : List<dynamic>.from(
                desiredLocation!.map((x) => desiredLocationValues.reverse[x])),
        "Desired_Industry": desiredIndustry,
        "_id": id,
      };
}

enum Type { EMPTY, FULL_TIME, TYPE_FULL_TIME }

final typeValues = EnumValues({
  "": Type.EMPTY,
  "Full time": Type.FULL_TIME,
  "Full Time": Type.TYPE_FULL_TIME
});

enum DesiredJobType { PERMANENT, CONTRACTUAL }

final desiredJobTypeValues = EnumValues({
  "Contractual": DesiredJobType.CONTRACTUAL,
  "Permanent": DesiredJobType.PERMANENT
});

enum DesiredLocation { HYDERABAD, PUNE }

final desiredLocationValues = EnumValues(
    {"Hyderabad": DesiredLocation.HYDERABAD, "Pune": DesiredLocation.PUNE});

enum DesiredPrefferedShift { ANY_SHIFT, DAY_SHIFT, ANY }

final desiredPrefferedShiftValues = EnumValues({
  "Any": DesiredPrefferedShift.ANY,
  "Any Shift": DesiredPrefferedShift.ANY_SHIFT,
  "Day Shift": DesiredPrefferedShift.DAY_SHIFT
});

enum Collegename { EMPTY, JAWAHARLAL_NEHRU_TECHNOLOGICAL_UNIVERSITY_ANANTAPUR }

final collegenameValues = EnumValues({
  "": Collegename.EMPTY,
  "JAWAHARLAL NEHRU TECHNOLOGICAL UNIVERSITY ANANTAPUR":
      Collegename.JAWAHARLAL_NEHRU_TECHNOLOGICAL_UNIVERSITY_ANANTAPUR
});

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
  num? passedoutyear;
  Type? courseType;
  num? marks;
  String? id;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        highestgraduation: json["highestgraduation"],
        course: json["course"],
        specialization: json["specialization"],
        institute: json["institute"],
        passedoutyear:
            json["passedoutyear"] == null ? null : json["passedoutyear"],
        courseType: typeValues.map![json["courseType"]],
        marks: json["marks"] == null ? null : json["marks"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "highestgraduation": highestgraduation,
        "course": course,
        "specialization": specialization,
        "institute": institute,
        "passedoutyear": passedoutyear == null ? null : passedoutyear,
        "courseType": typeValues.reverse[courseType],
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
    this.startYear,
    this.endYear,
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
  String? noticePeriod;
  String? months;
  List<String>? designation;
  List<String>? organization;
  DateTime? startYear;
  DateTime? endYear;
  ProfileDescription? profileDescription;
  String? offerLetter;
  String? expLetter;
  String? salaryslip;
  String? bankStatement;
  String? offerLetterName;
  String? expLetterName;
  String? salaryslipName;
  String? bankStatementName;
  CurrentCtc? currentCtc;
  String? id;

  factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        years: totalExperienceValues.map![json["years"]],
        isCurrentCompany: passportValues.map![json["isCurrentCompany"]],
        noticePeriod: json["noticePeriod"],
        months: json["months"],
        designation: json["designation"] == null
            ? null
            : List<String>.from(json["designation"].map((x) => x)),
        organization: json["organization"] == null
            ? null
            : List<String>.from(json["organization"].map((x) => x)),
        startYear: json["startYear"] == null
            ? null
            : DateTime.parse(json["startYear"]),
        endYear:
            json["endYear"] == null ? null : DateTime.parse(json["endYear"]),
        profileDescription:
            profileDescriptionValues.map![json["profileDescription"]],
        offerLetter: json["offerLetter"],
        expLetter: json["expLetter"],
        salaryslip: json["salaryslip"],
        bankStatement: json["BankStatement"],
        offerLetterName: json["offerLetterName"],
        expLetterName: json["expLetterName"],
        salaryslipName: json["salaryslipName"],
        bankStatementName: json["BankStatementName"],
        currentCtc: currentCtcValues.map![json["CurrentCTC"]],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "years": totalExperienceValues.reverse[years],
        "isCurrentCompany": passportValues.reverse[isCurrentCompany],
        "noticePeriod": noticePeriod,
        "months": months,
        "designation": designation == null
            ? null
            : List<dynamic>.from(designation!.map((x) => x)),
        "organization": List<dynamic>.from(organization!.map((x) => x)),
        "startYear": startYear == null ? null : startYear!.toIso8601String(),
        "endYear": endYear!.toIso8601String(),
        "profileDescription":
            profileDescriptionValues.reverse[profileDescription],
        "offerLetter": offerLetter,
        "expLetter": expLetter,
        "salaryslip": salaryslip,
        "BankStatement": bankStatement,
        "offerLetterName": offerLetterName,
        "expLetterName": expLetterName,
        "salaryslipName": salaryslipName,
        "BankStatementName": bankStatementName,
        "CurrentCTC": currentCtcValues.reverse[currentCtc],
        "_id": id,
      };
}

enum CurrentCtc { THE_03_LPA, THE_1520_LPA, EMPTY }

final currentCtcValues = EnumValues({
  "": CurrentCtc.EMPTY,
  "0-3 LPA": CurrentCtc.THE_03_LPA,
  "15-20 LPA": CurrentCtc.THE_1520_LPA
});

enum Passport { EMPTY, NO, YES }

final passportValues =
    EnumValues({"": Passport.EMPTY, "No": Passport.NO, "Yes": Passport.YES});

enum ProfileDescription { EMPTY, ENGINEER, ACCOUNTANT }

final profileDescriptionValues = EnumValues({
  "Accountant": ProfileDescription.ACCOUNTANT,
  "": ProfileDescription.EMPTY,
  "Engineer\n": ProfileDescription.ENGINEER
});

enum TotalExperience { THE_02_YEARS, THE_10_YEARS, EMPTY }

final totalExperienceValues = EnumValues({
  "": TotalExperience.EMPTY,
  "0-2 Years": TotalExperience.THE_02_YEARS,
  "10+ Years": TotalExperience.THE_10_YEARS
});

enum Experience { EXPERIENCED, EMPTY, FRESHER }

final experienceValues = EnumValues({
  "": Experience.EMPTY,
  "experienced": Experience.EXPERIENCED,
  "fresher": Experience.FRESHER
});

enum Lastname { EMPTY, FATIMA, GOUD }

final lastnameValues = EnumValues(
    {"": Lastname.EMPTY, "Fatima": Lastname.FATIMA, "GOUD": Lastname.GOUD});

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
    this.personaldetailsAge,
    this.languages,
    this.age,
  });

  DateTime? dateofbirth;
  String? address;
  Gender? gender;
  int? pincode;
  MaritalStatus? maritalStatus;
  String? hometown;
  String? addressProof;
  AdressProofNumber? adressProofNumber;
  Passport? passport;
  String? margaccount;
  num? personaldetailsAge;
  List<String>? languages;
  dynamic age;

  factory Personaldetails.fromJson(Map<String, dynamic> json) =>
      Personaldetails(
        dateofbirth: json["dateofbirth"] == null
            ? null
            : DateTime.parse(json["dateofbirth"]),
        address: json["address"],
        gender: genderValues.map![json["gender"]],
        pincode: json["pincode"] == null ? null : json["pincode"],
        maritalStatus: maritalStatusValues.map![json["maritalStatus"]],
        hometown: json["hometown"],
        addressProof: json["AddressProof"],
        adressProofNumber:
            adressProofNumberValues.map![json["AdressProofNumber"]],
        passport: passportValues.map![json["passport"]],
        margaccount: json["margaccount"],
        personaldetailsAge: json["age"] == null ? null : json["age"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        age: json["Age"],
      );

  Map<String, dynamic> toJson() => {
        "dateofbirth":
            dateofbirth == null ? null : dateofbirth!.toIso8601String(),
        "address": address,
        "gender": genderValues.reverse[gender],
        "pincode": pincode == null ? null : pincode,
        "maritalStatus": maritalStatusValues.reverse[maritalStatus],
        "hometown": hometown,
        "AddressProof": addressProof,
        "AdressProofNumber": adressProofNumberValues.reverse[adressProofNumber],
        "passport": passportValues.reverse[passport],
        "margaccount": margaccount,
        "age": personaldetailsAge == null ? null : personaldetailsAge,
        "languages": List<dynamic>.from(languages!.map((x) => x)),
        "Age": age,
      };
}

enum AdressProofNumber { EMPTY, THE_403044122591 }

final adressProofNumberValues = EnumValues({
  "": AdressProofNumber.EMPTY,
  "403044122591": AdressProofNumber.THE_403044122591
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

enum MaritalStatus { EMPTY, MARRIED, UN_MARRIED }

final maritalStatusValues = EnumValues({
  "": MaritalStatus.EMPTY,
  "Married": MaritalStatus.MARRIED,
  "UnMarried": MaritalStatus.UN_MARRIED
});

class Resume {
  Resume({
    this.filename,
    this.url,
  });

  Filename? filename;
  String? url;

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
        filename: filenameValues.map![json["filename"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filenameValues.reverse[filename],
        "url": url,
      };
}

enum Filename { EMPTY, DORABABU_PDF }

final filenameValues =
    EnumValues({"Dorababu.pdf": Filename.DORABABU_PDF, "": Filename.EMPTY});

enum State1 { TELANGANA, EMPTY, MAHARASHTRA }

final stateValues = EnumValues({
  "": State1.EMPTY,
  "Maharashtra": State1.MAHARASHTRA,
  "Telangana": State1.TELANGANA
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
