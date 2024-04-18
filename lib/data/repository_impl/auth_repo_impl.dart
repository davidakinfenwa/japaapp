import 'package:dartz/dartz.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/exceptions/exception_code.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/exceptions/failure.dart';
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/core/util/unit_impl.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/data/remote_data/auth_remote_data.dart';
import 'package:japaapp/domain/form_params/auth/email_validation_form_params.dart';
import 'package:japaapp/domain/form_params/auth/forgot_password_form_params.dart';
import 'package:japaapp/domain/form_params/auth/otp_verification_form_params.dart';
import 'package:japaapp/domain/form_params/auth/resend_otp_form_params.dart';
import 'package:japaapp/domain/form_params/auth/signin_form_params.dart';
import 'package:japaapp/domain/form_params/auth/signup_form_params.dart';
import 'package:japaapp/domain/model/auth/email_verification_otp_model.dart';
import 'package:japaapp/domain/model/auth/resend_otp_response_model.dart';
import 'package:japaapp/domain/model/auth/user_info_model.dart';
import 'package:japaapp/domain/model/auth_key_model.dart';
import 'package:japaapp/domain/model/shared/response_model.dart';
import 'package:japaapp/domain/repositories/repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;
  //final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required NetworkInfo networkInfo,
    // required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
  })  : _networkInfo = networkInfo,
        // _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> emailRegistration(
      {required EmailValidationFromParams emailValidationFromParams}) async {
    if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.emailregistration(
            emailValidationFromParams: emailValidationFromParams);

        await TokenService().saveUserId(userId:userInfoModel.data.id.toString() );

        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure(
          exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }


   @override
Future<Either<Failure<ExceptionMessage>, EmailVerificationOtpModel>>
      verifyEmailOTPCode({required EmailOtpVerificationFormParams emailOtpVerificationFormParams})async {
      if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.emailverification(
            emailOtpVerificationFormParams: emailOtpVerificationFormParams);

       // await TokenService().saveUserId(userId:userInfoModel.data.id.toString() );

        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure(
          exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }

   @override
  Future<Either<Failure<ExceptionMessage>, ResendOtpModel>>
      resendOTPVerificationCode(
          {required ResendOtpFormParams resendOtpFormParams})async {
    if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.resendotp(
            resendOtpFormParams: resendOtpFormParams);

       // await TokenService().saveUserId(userId:userInfoModel.data.id.toString() );

        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure(
          exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }

    @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> signup(
      {required SignUpFromParams signUpFromParams})async {
     if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.signup(
            signUpFromParams: signUpFromParams);

        await TokenService().saveToken(token:userInfoModel.accessToken.toString() );

        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure(
          exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }

   @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> signin(
      {required SignInFromParams signInFromParams})async {
      if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.signin(
            signInFromParams: signInFromParams);

        await TokenService().saveToken(token:userInfoModel.accessToken.toString());

        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure(
          exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }


  @override
  Future<Either<Failure<ExceptionMessage>, ResponseModel<AuthKeyModel>>>
      forgotPassword(
          {required ForgotPasswordFormParams forgotPasswordFormParams}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>>
      getAuthenticatedUser() {
    // TODO: implement getAuthenticatedUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure<ExceptionMessage>, UserInfoModel>> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

 
 

  @override
  Future<Either<Failure<ExceptionMessage>, UnitImpl>> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }



  @override
  Future<Either<Failure<ExceptionMessage>, GenericResponseModel>>
      verifyPasswordResetOTPCode(
          {required ForgotPasswordOtpVerificationFormParams
              forgotPasswordOtpVerificationFormParams}) {
    // TODO: implement verifyPasswordResetOTPCode
    throw UnimplementedError();
  }

 
}
