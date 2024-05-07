class SetDueDateFormParams {
    final String id;
    final String dueDate;

    SetDueDateFormParams({
        required this.id,
        required this.dueDate,
    });

    factory SetDueDateFormParams.fromJson(Map<String, dynamic> json) => SetDueDateFormParams(
        id: json["id"],
        dueDate: json["due_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "due_date": dueDate,
    };
}





class MarkTaskDoneFormParams {
    final String id;
    final String status;

    MarkTaskDoneFormParams({
        required this.id,
        required this.status,
    });

    factory MarkTaskDoneFormParams.fromJson(Map<String, dynamic> json) => MarkTaskDoneFormParams(
        id: json["id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
    };
}




class DeleteTaskFormParams {
    final String id;

    DeleteTaskFormParams({
        required this.id,
    });

    factory DeleteTaskFormParams.fromJson(Map<String, dynamic> json) => DeleteTaskFormParams(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
