import 'package:equatable/equatable.dart';



class EmailOtpVerificationFormParams extends Equatable {
  final String id;
  final String otp;

  const EmailOtpVerificationFormParams(
      {required this.id, required this.otp});

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'id': id,
    };
  }

  @override
  List<Object> get props => [otp, id];

  @override
  String toString() =>
      'EmailOtpVerificationFormParams(email: $id, otp: $otp)';
}


// Todo: Change the model to email and otp fields
class ForgotPasswordOtpVerificationFormParams extends Equatable {
  final String otpCode;
  final String phoneNumber;

  const ForgotPasswordOtpVerificationFormParams(
      {required this.otpCode, required this.phoneNumber});

  // auth-key will be added in the data-layer
  Map<String, dynamic> toJson() {
    return {
      'otp_key': otpCode,
      'u_key': phoneNumber,
    };
  }

  @override
  List<Object> get props => [otpCode, phoneNumber];

  @override
  String toString() =>
      'ForgotPasswordOtpVerificationFormParams(otpCode: $otpCode, phoneNumber: $phoneNumber)';
}
