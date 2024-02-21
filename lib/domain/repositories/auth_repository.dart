import 'package:dartz/dartz.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/util/unit_impl.dart';
import 'package:japaapp/domain/form_params/form_params.dart';

import '../model/models.dart';


abstract class AuthRepository {
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>>
      getAuthenticatedUser();

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

  Future<Either<Failure<ExceptionMessage>, GenericResponseModel>>
      changePassword(
          {required ChangePasswordFormParams changePasswordFormParams});

  Future<Either<Failure<ExceptionMessage>, ResponseModel<GenericResponseModel>>>
      verifySignupOTPCode({
    required SignupOtpVerificationFormParams signupOtpVerificationFormParams,
  });

  Future<Either<Failure<ExceptionMessage>, GenericResponseModel>>
      resendOTPVerificationCode(
          {required ResendOtpFormParams resendOtpFormParams});

  Future<Either<Failure<ExceptionMessage>, UnitImpl>> signout();
}
