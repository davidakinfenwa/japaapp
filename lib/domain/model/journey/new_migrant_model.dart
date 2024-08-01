

class NewMigrantResponseModel {
    final String status;
    final String message;
    final List<NewMigrantModel> data;

    NewMigrantResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory NewMigrantResponseModel.fromJson(Map<String, dynamic> json) => NewMigrantResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<NewMigrantModel>.from(json["data"].map((x) => NewMigrantModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
    factory NewMigrantResponseModel.empty(){
      return NewMigrantResponseModel(status: "", message: "", data: []);
    }
}

class NewMigrantModel {
    final String id;
    final String userId;
    final String task;
    final String category;
    final dynamic dueDate;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;

    NewMigrantModel({
        required this.id,
        required this.userId,
        required this.task,
        required this.category,
        required this.dueDate,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory NewMigrantModel.fromJson(Map<String, dynamic> json) => NewMigrantModel(
        id: json["id"],
        userId: json["user_id"],
        task: json["task"],
        category: json["category"],
        dueDate: json["due_date"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "task": task,
        "category": category,
        "due_date": dueDate,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
    factory NewMigrantModel.empty(){
      return NewMigrantModel(id: "", userId: "", task: "", category: "", dueDate: "", status: "", createdAt: DateTime.now(), updatedAt: DateTime.now());
    }
}
