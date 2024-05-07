

class TaskActionModel {
    final String status;
    final String message;
    final int data;

    TaskActionModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory TaskActionModel.fromJson(Map<String, dynamic> json) => TaskActionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
    };

    factory TaskActionModel.empty(){
      return TaskActionModel(status: "", message: "", data: 0);
    }
}
