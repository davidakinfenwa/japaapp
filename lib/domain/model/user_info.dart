// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final dynamic emailVerifiedAt;
  final dynamic profileImage;
  final String accountType;
  final dynamic username;
  final String isVerified;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;

  // static value to hold success code for auth-registration endpoint
   bool get SUCCESS_RESPONSE_CODE => isVerified== "1";

  const UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.profileImage,
    required this.accountType,
    required this.username,
    required this.isVerified,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserInfo.empty() {
    return const UserInfo(
      id: "",
      firstName: "",
      lastName: "",
      email: "",
      emailVerifiedAt: "",
      profileImage: "",
      accountType: "",
      username: "",
      isVerified: "",
      deletedAt: "",
      createdAt: "",
      updatedAt: "",
    );
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'].toString(),
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      profileImage: json['profile_image'],
      accountType: json['account_type'],
      username: json['username'],
      isVerified: json['is_verified'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "email_verified_at": emailVerifiedAt,
      "profile_image": profileImage,
      "account_type": accountType,
      "username": username,
      "is_verified": isVerified,
      "deleted_at": deletedAt,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }


  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      emailVerifiedAt,
      profileImage,
      accountType,
      username,
      isVerified,
      deletedAt,
      createdAt,
      updatedAt,
    ];
  }

  @override
  String toString() {
    return 'UserInfo(id: $id, firstName: $firstName, lastName: $lastName, lastName: $lastName, email: $email, emailVerifiedAt: $emailVerifiedAt, profileImage: $profileImage, accountType: $accountType, username: $username, isVerified: $isVerified, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt:$updatedAt)';
  }
}

class Data {
  final UserInfo user;
   
  UserInfo get userData=>UserInfo.empty();
 
  Data({
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserInfo.fromJson(json["user"]),
        // user:(json["user"]as List).map((e) => null)
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors();

  Map<String, dynamic> toJson() => {};
}

class UserInfoModel extends Equatable {
  final bool status;
  final String message;
  final Data data;
  final Errors errors;
  final int responseNo;

  UserInfo get user => data.user;
  bool get hasUserInfo => data.user.firstName.isNotEmpty;

  // sign-in navigation-action cases
  bool get VERIFY_ACCOUNT => responseNo == 2;
  bool get SIGN_IN_SUCCESSFUL => responseNo == 7;

  // sign-up navigation-action case
  bool get SIGN_UP_SUCCESSFUL => responseNo == 1;

  // initializing user-profile after login or sign-up
  bool get USER_PROFILE_SUCCESSFUL => responseNo == 2;

  const UserInfoModel({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
    required this.responseNo,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      status: json["status"],
      message: json["message"],
      data: Data.fromJson(json["data"]),
      errors: Errors.fromJson(json["errors"]),
      responseNo: json["response_no"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data.toJson(),
      "errors": errors.toJson(),
      "response_no": responseNo,
    };
  }

  @override
  List<Object> get props => [status, message, data, responseNo];

  @override
  String toString() {
    return 'UserInfoModel(response: $status, message: $message, userInfo: $data, responseNumber: $responseNo)';
  }
}


