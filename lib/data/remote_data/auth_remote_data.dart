
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/auth/email_verification_otp_model.dart';
import 'package:japaapp/domain/model/auth/resend_otp_response_model.dart';
import 'package:japaapp/domain/model/models.dart';

abstract class AuthRemoteDataSource {
  Future<UserInfoModel> emailregistration({required EmailValidationFromParams emailValidationFromParams});
  Future<EmailVerificationOtpModel> emailverification({required EmailOtpVerificationFormParams emailOtpVerificationFormParams});
  Future<ResendOtpModel> resendotp({required ResendOtpFormParams resendOtpFormParams});
  Future<UserInfoModel> signup({required SignUpFromParams signUpFromParams});
  Future<UserInfoModel> signin({required SignInFromParams signInFromParams});

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
   final Services _services;

  AuthRemoteDataSourceImpl({ required Services services})
      : _services=services;
  @override
  Future<UserInfoModel> emailregistration({required EmailValidationFromParams emailValidationFromParams})async {
    
    var apiRes= await _services.post(uri:Endpoints.emailRegistration,data: emailValidationFromParams);
    //final resData = jsonDecode(apiRes.data);
    return UserInfoModel.fromJson(apiRes.data);
  }
  
  @override
  Future<EmailVerificationOtpModel> emailverification({required EmailOtpVerificationFormParams emailOtpVerificationFormParams})async {
    var apiRes= await _services.post(uri:  Endpoints.emailValidationOtp,data: emailOtpVerificationFormParams);
    //final resData = jsonDecode(apiRes.data);
    return EmailVerificationOtpModel.fromJson(apiRes.data);
  }
  
  @override
  Future<ResendOtpModel> resendotp({required ResendOtpFormParams resendOtpFormParams}) async{
   
    var apiRes= await _services.post(uri:  Endpoints.resendOtp,data: resendOtpFormParams);
    //final resData = jsonDecode(apiRes.data);
    return ResendOtpModel.fromJson(apiRes.data);
  }
  
  @override
  Future<UserInfoModel> signup({required SignUpFromParams signUpFromParams}) async{
   var apiRes= await _services.post(uri:  Endpoints.signUp,data: signUpFromParams);
    //final resData = jsonDecode(apiRes.data);
    return UserInfoModel.fromJson(apiRes.data);
  }
  
  @override
  Future<UserInfoModel> signin({required SignInFromParams signInFromParams})async {
    var apiRes= await _services.post(uri:  Endpoints.signIn,data: signInFromParams);
    //final resData = jsonDecode(apiRes.data);
    return UserInfoModel.fromJson(apiRes.data);
  }



}