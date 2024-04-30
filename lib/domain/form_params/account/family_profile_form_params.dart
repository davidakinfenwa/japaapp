

class FamilyProfileFormModel {
    
    final String maritalStatus;
    final dynamic firstName;
    final dynamic surname;
    final dynamic otherName;
    final dynamic numberOfChildren;
    final List<WorkFamily> work;
    final List<EducationFamily> education;

    FamilyProfileFormModel({
        
        required this.maritalStatus,
        required this.firstName,
        required this.surname,
        required this.otherName,
        required this.numberOfChildren,
        required this.work,
        required this.education,
    });

    factory FamilyProfileFormModel.fromJson(Map<String, dynamic> json) => FamilyProfileFormModel(

        maritalStatus: json["marital_status"],
        firstName: json["first_name"],
        surname: json["surname"],
        otherName: json["other_name"],
        numberOfChildren: json["number_of_children"],
        work: List<WorkFamily>.from(json["work"].map((x) => WorkFamily.fromJson(x))),
        education: List<EducationFamily>.from(json["education"].map((x) => EducationFamily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "marital_status": maritalStatus,
        "first_name": firstName,
        "surname": surname,
        "other_name": otherName,
        "number_of_children": numberOfChildren,
        "work": List<dynamic>.from(work.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
    };
}

class EducationFamily {
     String levelEducation;
     String institution;
     String fromDate;
     String toDate;
     String major;
     String scale;
     String grade;
     dynamic isStillInschool;

    EducationFamily({
        required this.levelEducation,
        required this.institution,
        required this.fromDate,
        required this.toDate,
        required this.major,
        required this.scale,
        required this.grade,
        required this.isStillInschool,
    });

    factory EducationFamily.fromJson(Map<String, dynamic> json) => EducationFamily(
        levelEducation: json["level_education"],
        institution: json["institution"],
        fromDate: json["from_date"],
        toDate: json["to_date"],
        major: json["major"],
        scale: json["scale"],
        grade: json["grade"],
        isStillInschool: json["is_still_inschool"],
    );

    Map<String, dynamic> toJson() => {
        "level_education": levelEducation,
        "institution": institution,
        "from_date": fromDate,
        "to_date": toDate,
        "major": major,
        "scale": scale,
        "grade": grade,
        "is_still_inschool": isStillInschool,
    };
}

class WorkFamily {
     String companyName;
     String position;
     String dateFrom;
     String dateTo;
     dynamic isCurrentWork;

    WorkFamily({
        required this.companyName,
        required this.position,
        required this.dateFrom,
        required this.dateTo,
        required this.isCurrentWork,
    });

    factory WorkFamily.fromJson(Map<String, dynamic> json) => WorkFamily(
        companyName: json["company_name"],
        position: json["position"],
        dateFrom:json["date_from"],
        dateTo: json["date_to"],
        isCurrentWork: json["is_current_work"],
    );

    Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "position": position,
        "date_from": dateFrom,
        "date_to": dateTo,
        "is_current_work": isCurrentWork,
    };
    
}
