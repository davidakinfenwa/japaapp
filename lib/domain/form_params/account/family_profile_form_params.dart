

class FamilyProfileFormModel {
    final dynamic userId;
    final String maritalStatus;
    final dynamic firstName;
    final dynamic surname;
    final dynamic otherName;
    final dynamic numberOfChildren;
    final DateTime updatedAt;
    final DateTime createdAt;
    final dynamic id;
    final List<WorkFamily> work;
    final List<EducationFamily> education;

    FamilyProfileFormModel({
        required this.userId,
        required this.maritalStatus,
        required this.firstName,
        required this.surname,
        required this.otherName,
        required this.numberOfChildren,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
        required this.work,
        required this.education,
    });

    factory FamilyProfileFormModel.fromJson(Map<String, dynamic> json) => FamilyProfileFormModel(
        userId: json["user_id"],
        maritalStatus: json["marital_status"],
        firstName: json["first_name"],
        surname: json["surname"],
        otherName: json["other_name"],
        numberOfChildren: json["number_of_children"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        work: List<WorkFamily>.from(json["work"].map((x) => WorkFamily.fromJson(x))),
        education: List<EducationFamily>.from(json["education"].map((x) => EducationFamily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "marital_status": maritalStatus,
        "first_name": firstName,
        "surname": surname,
        "other_name": otherName,
        "number_of_children": numberOfChildren,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "work": List<dynamic>.from(work.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
    };
}

class EducationFamily {
    final String levelEducation;
    final String institution;
    final DateTime fromDate;
    final DateTime toDate;
    final String major;
    final String scale;
    final String grade;
    final dynamic isStillInschool;

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
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        major: json["major"],
        scale: json["scale"],
        grade: json["grade"],
        isStillInschool: json["is_still_inschool"],
    );

    Map<String, dynamic> toJson() => {
        "level_education": levelEducation,
        "institution": institution,
        "from_date": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
        "to_date": "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
        "major": major,
        "scale": scale,
        "grade": grade,
        "is_still_inschool": isStillInschool,
    };
}

class WorkFamily {
    final String companyName;
    final String position;
    final DateTime dateFrom;
    final DateTime dateTo;
    final dynamic isCurrentWork;

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
        dateFrom: DateTime.parse(json["date_from"]),
        dateTo: DateTime.parse(json["date_to"]),
        isCurrentWork: json["is_current_work"],
    );

    Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "position": position,
        "date_from": "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
        "date_to": "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
        "is_current_work": isCurrentWork,
    };
    
}
