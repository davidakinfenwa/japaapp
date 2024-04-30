

class IntendingMigrantProcessModel {
    final String status;
    final String message;
    final List<Datum> data;

    IntendingMigrantProcessModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory IntendingMigrantProcessModel.fromJson(Map<String, dynamic> json) => IntendingMigrantProcessModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };

    factory IntendingMigrantProcessModel.empty(){
      return IntendingMigrantProcessModel(status: "", message: "", data: []);
    }
}

class Datum {
    final String id;
    final String userId;
    final String task;
    final DateTime createdAt;
    final DateTime updatedAt;

    Datum({
        required this.id,
        required this.userId,
        required this.task,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        task: json["task"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "task": task,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
