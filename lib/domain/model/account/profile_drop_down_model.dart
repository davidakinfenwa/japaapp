

class ProfileDropDownModel {
    final String status;
    final DropDownData data;

    ProfileDropDownModel({
        required this.status,
        required this.data,
    });

    factory ProfileDropDownModel.fromJson(Map<String, dynamic> json) => ProfileDropDownModel(
        status: json["status"],
        data: DropDownData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
    factory ProfileDropDownModel.empty(){
      return ProfileDropDownModel(status: "", data: DropDownData.empty());
    }
}

class DropDownData {
    final List<Gradescale> levelofeduction;
    final List<Gradescale> gradescale;
    final List<String> maritalStatus;
    final List<String> record;

    DropDownData({
        required this.levelofeduction,
        required this.gradescale,
        required this.maritalStatus,
        required this.record,
    });

    factory DropDownData.fromJson(Map<String, dynamic> json) => DropDownData(
        levelofeduction: List<Gradescale>.from(json["levelofeduction"].map((x) => Gradescale.fromJson(x))),
        gradescale: List<Gradescale>.from(json["gradescale"].map((x) => Gradescale.fromJson(x))),
        maritalStatus: List<String>.from(json["marital_status"].map((x) => x)),
        record: List<String>.from(json["record"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "levelofeduction": List<dynamic>.from(levelofeduction.map((x) => x.toJson())),
        "gradescale": List<dynamic>.from(gradescale.map((x) => x.toJson())),
        "marital_status": List<dynamic>.from(maritalStatus.map((x) => x)),
        "record": List<dynamic>.from(record.map((x) => x)),
    };
  factory DropDownData.empty(){
    return DropDownData(levelofeduction: [], gradescale: [], maritalStatus: [], record: []);
  }
}

class Gradescale {
    final String id;
    final String name;
    final Status status;

    Gradescale({
        required this.id,
        required this.name,
        required this.status,
    });

    factory Gradescale.fromJson(Map<String, dynamic> json) => Gradescale(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
    };
}

enum Status {
    ACTIVE
}

final statusValues = EnumValues({
    "Active": Status.ACTIVE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
