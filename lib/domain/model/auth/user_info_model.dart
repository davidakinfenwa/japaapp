

class UserInfoModel {
    final String status;
    final String message;
    final UserInfo data;
    final String? accessToken;

    UserInfoModel({
        required this.status,
        required this.message,
        required this.data,
        this.accessToken
    });

    factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
       status: json["status"] != null ? json["status"] : "",
        message:  json["message"] != null ? json["status"] : "",
        data: UserInfo.fromJson(json["data"]),
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "access_token": accessToken
    };

    factory UserInfoModel.empty(){
      return UserInfoModel(status:"",message:"",data:UserInfo.empty());
    }
}

class UserInfo {
    final String email;
    final dynamic firstName;
    final dynamic otherName;
    final dynamic lastName;
    final dynamic phoneNumber;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int id;

    UserInfo({
        required this.email,
        required this.firstName,
        required this.otherName,
        required this.lastName,
        required this.phoneNumber,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.id,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        email: json["email"],
        firstName: json["first_name"],
        otherName: json["other_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "other_name": otherName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
    };

    factory UserInfo.empty(){
      return UserInfo(email: "", firstName: "", otherName: "", lastName: "", phoneNumber: "", status: "", createdAt: DateTime.now(), updatedAt: DateTime.now(), id: 0);
    }


  @override
  String toString() {
    return 'UserInfo(id: $id, firstName: $firstName, lastName: $lastName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, status: $status, createdAt: $createdAt, updatedAt:$updatedAt)';
  }
}
