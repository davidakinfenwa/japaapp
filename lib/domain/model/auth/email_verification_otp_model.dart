import 'package:equatable/equatable.dart';

class EmailVerificationOtpModel extends Equatable {
  final String status;
  final String message;
  final bool expired;

  const EmailVerificationOtpModel({
    required this.status,
    required this.message,
    required this.expired,
  });

  factory EmailVerificationOtpModel.fromJson(Map<String, dynamic> json) =>
      EmailVerificationOtpModel(
        status: json["status"],
        message: json["message"],
        expired: json["expired"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "expired": expired,
      };
  factory EmailVerificationOtpModel.empty() {
    return const EmailVerificationOtpModel(status: "", message: "", expired: false);
  }

  @override
  String toString() {
    return "EmailVerificationOtpModel(status: $status, message: $message, expired: $expired)";
  }

  @override
  List<Object?> get props => [status, message, expired];
}
