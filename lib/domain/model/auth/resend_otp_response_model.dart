

class ResendOtpModel {
    final String status;
    final String message;
    final String data;

    ResendOtpModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ResendOtpModel.fromJson(Map<String, dynamic> json) => ResendOtpModel(
        status: json["status"]??"",
        message: json["message"]??"",
        data: json["data"]??"",
    );
    factory ResendOtpModel.empty(){
      return ResendOtpModel(status: "", message: "", data: "");
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
    };
}
