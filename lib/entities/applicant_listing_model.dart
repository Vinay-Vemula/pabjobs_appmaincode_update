import 'dart:convert';

// class Applicant {
//   final String avatarImage;
//   final String name;
//   final String jobType;
//   final String jobLocation;
//   final String education;
//   final String location;
//   final String experience;
//   final int status;
//   Applicant(
//     this.avatarImage,
//     this.name,
//     this.jobType,
//     this.jobLocation,
//     this.education,
//     this.location,
//     this.experience,
//     this.status,
//   );
// }

// To parse this JSON data, do
//
//     final applicantModel = applicantModelFromJson(jsonString);

// import 'dart:convert';

String applicantModelToJson(List<ApplicantModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<ApplicantModel> applicantModelFromJson(String str) =>
    List<ApplicantModel>.from(
        json.decode(str).map((x) => ApplicantModel.fromJson(x)));

class ApplicantModel {
  ApplicantModel({
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

  factory ApplicantModel.fromJson(Map<String, dynamic> json) => ApplicantModel(
        id: json["_id"],
        userId: json["userId"],
        recruiterId: json["recruiterId"],
        jobId: json["jobId"],
        status: json["status"],
        sop: json["sop"],
        dateOfApplication: DateTime.parse(json["dateOfApplication"]),
        v: json["__v"],
        jobApplicant: JobApplicant.fromJson(json["jobApplicant"]),
        job: Job.fromJson(json["job"]),
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
        "jobApplicant": jobApplicant!.toJson(),
        "job": job!.toJson(),
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
  String? salary;
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
  String? lastname;
  String? qualification;
  String? yop;
  String? locality;
  String? state;
  String? percentage;
  String? collegename;
  String? totalExperience;
  List<String>? currentlocation;
  String? resumeHeadline;
  String? profileSummary;
  List<String>? skills;
  int? rating;
  Resume? resume;
  String? profile;
  Personaldetails? personaldetails;
  int? contactNumber;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  DateTime? jobApplicantDate;
  List<Employment>? employment;
  List<Education>? education;
  List<Project>? project;
  List<Worksample>? worksample;
  List<dynamic>? presentation;
  List<dynamic>? publication;
  List<dynamic>? patent;
  List<dynamic>? certification;
  List<Careerprofile>? careerprofile;
  int? v;
  String? profileImage;

  factory JobApplicant.fromJson(Map<String, dynamic> json) => JobApplicant(
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
        totalExperience: json["total_experience"],
        currentlocation:
            List<String>.from(json["currentlocation"].map((x) => x)),
        resumeHeadline: json["resumeHeadline"],
        profileSummary: json["profileSummary"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        rating: json["rating"],
        resume: Resume.fromJson(json["resume"]),
        profile: json["profile"],
        personaldetails: Personaldetails.fromJson(json["personaldetails"]),
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
        presentation: List<dynamic>.from(json["presentation"].map((x) => x)),
        publication: List<dynamic>.from(json["publication"].map((x) => x)),
        patent: List<dynamic>.from(json["patent"].map((x) => x)),
        certification: List<dynamic>.from(json["certification"].map((x) => x)),
        careerprofile: List<Careerprofile>.from(
            json["careerprofile"].map((x) => Careerprofile.fromJson(x))),
        v: json["__v"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
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
        "total_experience": totalExperience,
        "currentlocation": List<dynamic>.from(currentlocation!.map((x) => x)),
        "resumeHeadline": resumeHeadline,
        "profileSummary": profileSummary,
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "rating": rating,
        "resume": resume!.toJson(),
        "profile": profile,
        "personaldetails": personaldetails!.toJson(),
        "contactNumber": contactNumber,
        "isPhoneVerified": isPhoneVerified,
        "isEmailVerified": isEmailVerified,
        "jobApplicantDate": jobApplicantDate!.toIso8601String(),
        "employment": List<dynamic>.from(employment!.map((x) => x.toJson())),
        "education": List<dynamic>.from(education!.map((x) => x.toJson())),
        "project": List<dynamic>.from(project!.map((x) => x.toJson())),
        "worksample": List<dynamic>.from(worksample!.map((x) => x.toJson())),
        "presentation": List<dynamic>.from(presentation!.map((x) => x)),
        "publication": List<dynamic>.from(publication!.map((x) => x)),
        "patent": List<dynamic>.from(patent!.map((x) => x)),
        "certification": List<dynamic>.from(certification!.map((x) => x)),
        "careerprofile":
            List<dynamic>.from(careerprofile!.map((x) => x.toJson())),
        "__v": v,
        "profileImage": profileImage,
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
  String? desiredLocation;
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
        passedoutyear: json["passedoutyear"],
        courseType: json["courseType"],
        marks: json["marks"].toDouble(),
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
        startYear: json["startYear"] == null
            ? null
            : DateTime.parse(json["startYear"]),
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
  String? passport;
  String? margaccount;
  int? age;
  List<String>? languages;

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
        passport: json["passport"],
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
        "passport": passport,
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
  DateTime? workDurationFrom;
  DateTime? workDurationTo;
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
