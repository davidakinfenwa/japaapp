

class AwardFormParam {
    final List<AwardRecord> record;

    AwardFormParam({
        required this.record,
    });

    factory AwardFormParam.fromJson(Map<String, dynamic> json) => AwardFormParam(
        record: List<AwardRecord>.from(json["record"].map((x) => AwardRecord.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "record": List<dynamic>.from(record.map((x) => x.toJson())),
    };
}

class AwardRecord {
     String type;
     String title;
     String date;

    AwardRecord({
        required this.type,
        required this.title,
        required this.date,
    });

    factory AwardRecord.fromJson(Map<String, dynamic> json) => AwardRecord(
        type: json["type"],
        title: json["title"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "date": date,
    };
}
