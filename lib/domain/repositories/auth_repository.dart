import 'package:dartz/dartz.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/util/unit_impl.dart';
import 'package:japaapp/domain/form_params/auth/email_validation_form_params.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/auth/email_verification_otp_model.dart';
import 'package:japaapp/domain/model/auth/resend_otp_response_model.dart';

import '../model/models.dart';

abstract class AuthRepository {
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>>
      getAuthenticatedUser();

  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> emailRegistration(
      {required EmailValidationFromParams emailValidationFromParams});

  Future<Either<Failure<ExceptionMessage>, EmailVerificationOtpModel>>
      verifyEmailOTPCode({
    required EmailOtpVerificationFormParams emailOtpVerificationFormParams,
  });

  Future<Either<Failure<ExceptionMessage>, ResendOtpModel>>
      resendOTPVerificationCode(
          {required ResendOtpFormParams resendOtpFormParams});

  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> signup(
      {required SignUpFromParams signUpFromParams});

  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> signin(
      {required SignInFromParams signInFromParams});

  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> getUserProfile();

  Future<Either<Failure<ExceptionMessage>, ResponseModel<AuthKeyModel>>>
      forgotPassword(
          {required ForgotPasswordFormParams forgotPasswordFormParams});

  Future<Either<Failure<ExceptionMessage>, GenericResponseModel>>
      verifyPasswordResetOTPCode(
          {required ForgotPasswordOtpVerificationFormParams
              forgotPasswordOtpVerificationFormParams});

 

  Future<Either<Failure<ExceptionMessage>, UnitImpl>> signout();
}
