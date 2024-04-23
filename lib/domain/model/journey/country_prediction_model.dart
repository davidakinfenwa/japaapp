
class CountryPredictionModel {
    final String status;
    final String message;
    final String data;

    CountryPredictionModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CountryPredictionModel.fromJson(Map<String, dynamic> json) => CountryPredictionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
    };

    factory CountryPredictionModel.empty(){
      return CountryPredictionModel(status: "", message: "", data: "");
    }
}
