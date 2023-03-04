// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    this.resume,
    this.personaldetails,
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
  String? experience;
  String? state;
  String? totalExperience;
  List<dynamic>? currentlocation;
  String? resumeHeadline;
  String? profileSummary;
  List<dynamic>? skills;
  int? rating;
  String? profile;
  int? contactNumber;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  DateTime? jobApplicantDate;
  List<Employment>? employment;
  List<Education>? education;
  List<Project>? project;
  List<Worksample>? worksample;
  List<Presentation>? presentation;
  List<Publication>? publication;
  List<Patent>? patent;
  List<Certification>? certification;
  List<CareerprofileElement>? careerprofile;
  int? v;
  String? profileImage;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        resume: json["resume"] == null ? null : Resume.fromJson(json["resume"]),
        personaldetails: json["personaldetails"] == null
            ? null
            : Personaldetails.fromJson(json["personaldetails"]),
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
        profile: json["profile"],
        contactNumber: json["contactNumber"],
        isPhoneVerified: json["isPhoneVerified"],
        isEmailVerified: json["isEmailVerified"],
        jobApplicantDate: DateTime.parse(json["jobApplicantDate"]),
        employment: List<Employment>.from(
            json["employment"].map((x) => Employment.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        project:
            List<Project>.from(json["project"].map((x) => Project.fromJson(x))),
        worksample: List<Worksample>.from(
            json["worksample"].map((x) => Worksample.fromJson(x))),
        presentation: List<Presentation>.from(
            json["presentation"].map((x) => Presentation.fromJson(x))),
        publication: List<Publication>.from(
            json["publication"].map((x) => Publication.fromJson(x))),
        patent:
            List<Patent>.from(json["patent"].map((x) => Patent.fromJson(x))),
        certification: List<Certification>.from(
            json["certification"].map((x) => Certification.fromJson(x))),
        careerprofile: List<CareerprofileElement>.from(
            json["careerprofile"].map((x) => CareerprofileElement.fromJson(x))),
        v: json["__v"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "resume": resume == null ? null : resume!.toJson(),
        "personaldetails":
            personaldetails == null ? null : personaldetails!.toJson(),
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
        "profile": profile,
        "contactNumber": contactNumber,
        "isPhoneVerified": isPhoneVerified,
        "isEmailVerified": isEmailVerified,
        "jobApplicantDate": jobApplicantDate!.toIso8601String(),
        "employment": List<dynamic>.from(employment!.map((x) => x.toJson())),
        "education": List<dynamic>.from(education!.map((x) => x.toJson())),
        "project": List<dynamic>.from(project!.map((x) => x.toJson())),
        "worksample": List<dynamic>.from(worksample!.map((x) => x.toJson())),
        "presentation":
            List<dynamic>.from(presentation!.map((x) => x.toJson())),
        "publication": List<dynamic>.from(publication!.map((x) => x.toJson())),
        "patent": List<dynamic>.from(patent!.map((x) => x.toJson())),
        "certification":
            List<dynamic>.from(certification!.map((x) => x.toJson())),
        "careerprofile":
            List<dynamic>.from(careerprofile!.map((x) => x.toJson())),
        "__v": v,
        "profileImage": profileImage,
      };
}

class Worksample {
  Worksample({
    this.workTitle,
    this.workUrl,
    this.workDurationFrom,
    this.workDurationTo,
    this.workDescription,
    this.id,
  });

  String? workTitle;
  String? workUrl;
  dynamic workDurationFrom;
  dynamic workDurationTo;
  String? workDescription;
  String? id;

  factory Worksample.fromJson(Map<String, dynamic> json) => Worksample(
        workTitle: json["Work_Title"],
        workUrl: json["Work_URL"],
        workDurationFrom: DateTime.parse(json["Work_Duration_From"]),
        workDurationTo: DateTime.parse(json["Work_Duration_To"]),
        workDescription: json["Work_Description"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Work_Title": workTitle,
        "Work_URL": workUrl,
        "Work_Duration_From": workDurationFrom!.toIso8601String(),
        "Work_Duration_To": workDurationTo!.toIso8601String(),
        "Work_Description": workDescription,
        "_id": id,
      };
}

class Publication {
  Publication({
    this.publicationTitle,
    this.publicationUrl,
    this.publicationYear,
    this.publicationMonths,
    this.publicationDescription,
    this.id,
  });

  String? publicationTitle;
  String? publicationUrl;
  String? publicationYear;
  String? publicationMonths;
  String? publicationDescription;
  String? id;

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        publicationTitle: json["Publication_Title"],
        publicationUrl: json["Publication_URL"],
        publicationYear: json["Publication_Year"],
        publicationMonths: json["Publication_Months"],
        publicationDescription: json["Publication_Description"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Publication_Title": publicationTitle,
        "Publication_URL": publicationUrl,
        "Publication_Year": publicationYear,
        "Publication_Months": publicationMonths,
        "Publication_Description": publicationDescription,
        "_id": id,
      };
}

class Presentation {
  Presentation({
    this.presentationTitle,
    this.presentationUrl,
    this.presentationDescription,
    this.id,
  });

  String? presentationTitle;
  String? presentationUrl;
  String? presentationDescription;
  String? id;

  factory Presentation.fromJson(Map<String, dynamic> json) => Presentation(
        presentationTitle: json["Presentation_Title"],
        presentationUrl: json["Presentation_URL"],
        presentationDescription: json["Presentation_Description"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Presentation_Title": presentationTitle,
        "Presentation_URL": presentationUrl,
        "Presentation_Description": presentationDescription,
        "_id": id,
      };
}

class Patent {
  Patent({
    this.patentTitle,
    this.patentUrl,
    this.patentOffice,
    this.patentStatus,
    this.patentApplicationNumber,
    this.patentDescription,
    this.id,
  });

  String? patentTitle;
  String? patentUrl;
  String? patentOffice;
  String? patentStatus;
  String? patentApplicationNumber;
  String? patentDescription;
  String? id;

  factory Patent.fromJson(Map<String, dynamic> json) => Patent(
        patentTitle: json["Patent_Title"],
        patentUrl: json["Patent_URL"],
        patentOffice: json["Patent_Office"],
        patentStatus: json["Patent_Status"],
        patentApplicationNumber: json["Patent_Application_Number"],
        patentDescription: json["Patent_Description"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Patent_Title": patentTitle,
        "Patent_URL": patentUrl,
        "Patent_Office": patentOffice,
        "Patent_Status": patentStatus,
        "Patent_Application_Number": patentApplicationNumber,
        "Patent_Description": patentDescription,
        "_id": id,
      };
}

class Certification {
  Certification({
    this.certificationName,
    this.certificationId,
    this.certificationUrl,
    this.certificationValidityFrom,
    this.certificationValidityTo,
    this.id,
  });

  String? certificationName;
  String? certificationId;
  String? certificationUrl;
  DateTime? certificationValidityFrom;
  DateTime? certificationValidityTo;
  String? id;

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        certificationName: json["Certification_Name"],
        certificationId: json["Certification_ID"],
        certificationUrl: json["Certification_URL"],
        certificationValidityFrom:
            DateTime.parse(json["Certification_Validity_From"]),
        certificationValidityTo:
            DateTime.parse(json["Certification_Validity_To"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Certification_Name": certificationName,
        "Certification_ID": certificationId,
        "Certification_URL": certificationUrl,
        "Certification_Validity_From":
            certificationValidityFrom!.toIso8601String(),
        "Certification_Validity_To": certificationValidityTo!.toIso8601String(),
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

  String? years;
  String? isCurrentCompany;
  String? noticePeriod;
  String? months;
  List<String>? designation;
  List<String>? organization;
  DateTime? startYear;
  DateTime? endYear;
  String? profileDescription;
  String? offerLetter;
  String? expLetter;
  String? salaryslip;
  String? bankStatement;
  String? offerLetterName;
  String? expLetterName;
  String? salaryslipName;
  String? bankStatementName;
  String? currentCtc;
  String? id;

  factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        years: json["years"],
        isCurrentCompany: json["isCurrentCompany"],
        noticePeriod: json["noticePeriod"],
        months: json["months"],
        designation: List<String>.from(json["designation"].map((x) => x)),
        organization: List<String>.from(json["organization"].map((x) => x)),
        // startYear: DateTime.parse(json["startYear"]),
        endYear: DateTime.parse(json["endYear"]),
        profileDescription: json["profileDescription"],
        offerLetter: json["offerLetter"],
        expLetter: json["expLetter"],
        salaryslip: json["salaryslip"],
        bankStatement: json["BankStatement"],
        offerLetterName: json["offerLetterName"],
        expLetterName: json["expLetterName"],
        salaryslipName: json["salaryslipName"],
        bankStatementName: json["BankStatementName"],
        currentCtc: json["CurrentCTC"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "years": years,
        "isCurrentCompany": isCurrentCompany,
        "noticePeriod": noticePeriod,
        "months": months,
        "designation": List<dynamic>.from(designation!.map((x) => x)),
        "organization": List<dynamic>.from(organization!.map((x) => x)),
        "startYear": startYear!.toIso8601String(),
        "endYear": endYear!.toIso8601String(),
        "profileDescription": profileDescription,
        "offerLetter": offerLetter,
        "expLetter": expLetter,
        "salaryslip": salaryslip,
        "BankStatement": bankStatement,
        "offerLetterName": offerLetterName,
        "expLetterName": expLetterName,
        "salaryslipName": salaryslipName,
        "BankStatementName": bankStatementName,
        "CurrentCTC": currentCtc,
        "_id": id,
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
        projectStartDate: DateTime.parse(json["ProjectStartDate"]),
        projectWorkTill: DateTime.parse(json["ProjectWorkTill"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "ProjectTitle": projectTitle,
        "ProjectClient": projectClient,
        "ProjectDescription": projectDescription,
        "ProjectStartDate": projectStartDate!.toIso8601String(),
        "ProjectWorkTill": projectWorkTill!.toIso8601String(),
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
  dynamic? marks;
  String? id;

  factory Education.fromRawJson(String str) =>
      Education.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        highestgraduation: json["highestgraduation"],
        course: json["course"],
        specialization: json["specialization"],
        institute: json["institute"],
        passedoutyear: json["passedoutyear"],
        courseType: json["courseType"],
        marks: json["marks"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "highestgraduation": highestgraduation,
        "course": course,
        "specialization": specialization,
        "institute": institute,
        "passedoutyear": passedoutyear,
        "courseType": courseType,
        "marks": marks,
        "_id": id,
      };
}

class CareerprofileElement {
  CareerprofileElement({
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
  dynamic? desiredLocation;
  String? desiredIndustry;
  String? id;

  factory CareerprofileElement.fromRawJson(String str) =>
      CareerprofileElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CareerprofileElement.fromJson(Map<String, dynamic> json) =>
      CareerprofileElement(
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
        desiredLocation: json["Desired_Location"],
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
        "Desired_Location": desiredLocation,
        "Desired_Industry": desiredIndustry,
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
  Resume({
    this.filename,
    this.url,
  });

  String? filename;
  String? url;

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
        filename: json["filename"] == null ? null : json["filename"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename == null ? null : filename,
        "url": url == null ? null : url,
      };
}
