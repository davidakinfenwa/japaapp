
class WorkProfileModel {
    final List<WorkData> work;

    WorkProfileModel({
        required this.work,
    });

    factory WorkProfileModel.fromJson(Map<String, dynamic> json) => WorkProfileModel(
        work: List<WorkData>.from(json["work"].map((x) => WorkData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "work": List<dynamic>.from(work.map((x) => x.toJson())),
    };
}

class WorkData {
     String companyName;
     String position;
     String dateFrom;
     String dateTo;
    final bool isCurrentWork;

    WorkData({
        required this.companyName,
        required this.position,
        required this.dateFrom,
        required this.dateTo,
        required this.isCurrentWork,
    });

    factory WorkData.fromJson(Map<String, dynamic> json) => WorkData(
        companyName: json["company_name"],
        position: json["position"],
        dateFrom: json["date_from"],
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




class WorkDataForm {
    final String companyName;
    final String position;
    final String isCurrentWork;

    WorkDataForm({
        required this.companyName,
        required this.position,
        required this.isCurrentWork,
    });

    factory WorkDataForm.fromJson(Map<String, dynamic> json) => WorkDataForm(
        companyName: json["company_name"],
        position: json["position"],
        isCurrentWork: json["is_current_work"],
    );

    Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "position": position,
        "is_current_work": isCurrentWork,
    };
}