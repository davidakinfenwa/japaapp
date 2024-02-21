import 'package:equatable/equatable.dart';

// @freezed
// class OtpVerificationFromParams with _$OtpVerificationFromParams {
//   const factory OtpVerificationFromParams.signupForm({
//     required SignupOtpVerificationFormParams signupOtpVerificationFormParams,
//   }) = _SignupForm;
//   const factory OtpVerificationFromParams.forgotPasswordForm({
//     required ForgotPasswordOtpVerificationFormParams
//         forgotPasswordOtpVerificationFormParams,
//   }) = _ForgotPasswordForm;
// }

class SignupOtpVerificationFormParams extends Equatable {
  final String email;
  final String otp;

  const SignupOtpVerificationFormParams(
      {required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'email': email,
    };
  }

  @override
  List<Object> get props => [otp, email];

  @override
  String toString() =>
      'SignupOtpVerificationFormParams(email: $email, otp: $otp)';
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
