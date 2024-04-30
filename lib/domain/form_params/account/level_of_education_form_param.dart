

class EducationLevelModel {
    final List<EducationData> education;

    EducationLevelModel({
        required this.education,
    });

    factory EducationLevelModel.fromJson(Map<String, dynamic> json) => EducationLevelModel(
        education: List<EducationData>.from(json["education"].map((x) => EducationData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
    };
}

class EducationData {
     String levelEducation;
     String institution;
     String fromDate;
     String toDate;
     dynamic major;
     dynamic scale;
     dynamic grade;
     bool isStillInschool;

    EducationData({
        required this.levelEducation,
        required this.institution,
        required this.fromDate,
        required this.toDate,
        required this.major,
        required this.scale,
        required this.grade,
        required this.isStillInschool,
    });

    factory EducationData.fromJson(Map<String, dynamic> json) => EducationData(
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

    factory EducationData.empty(){
      return EducationData(levelEducation: "", institution: "", fromDate: "", toDate: "", major: "", scale: "", grade: "", isStillInschool: false);
    }
}
