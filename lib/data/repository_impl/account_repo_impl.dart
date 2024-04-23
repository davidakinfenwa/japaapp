import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/remote_data/account_remote_data.dart';
import 'package:japaapp/domain/form_params/form_params.dart';



import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final NetworkInfo _networkInfo;
  //final AuthLocalDataSource _localDataSource;
  final AccountRemoteDataSource _remoteDataSource;

  AccountRepositoryImpl({
    required NetworkInfo networkInfo,
    // required AuthLocalDataSource localDataSource,
    required AccountRemoteDataSource remoteDataSource,
  })  : _networkInfo = networkInfo,
        // _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> getAuthenticatedUserProfile() async {
    if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.getUserInfoData();
        //await TokenService().saveToken(token:userInfoModel.accessToken.toString());

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
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createBasicInformation({required BasicInformationFormParams basicInformationFormParams, required File? image}) async{
     if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.createBasicInfoData(basicInformationFormParams: basicInformationFormParams, image: image);

      

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
  Future<Either<Failure<ExceptionMessage>, ProfileDropDownModel>> getProfileDropdownData()async {
   if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.getProfileDropdownData();
        //await TokenService().saveToken(token:userInfoModel.accessToken.toString());

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
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createEducationInformation({required List<dynamic> educationLevelModel}) async {
   if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.createEducationInfoData(educationLevelModel: educationLevelModel);
        //await TokenService().saveToken(token:userInfoModel.accessToken.toString());

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
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createWorkInformation({required List workLevelModel})async {
    if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.createWorkInfoData(workLevelModel: workLevelModel);
        //await TokenService().saveToken(token:userInfoModel.accessToken.toString());

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
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createFamilyInformation({required FamilyProfileFormModel familyProfileFormModel})async {
       if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.createFamilyInformation(familyProfileFormModel: familyProfileFormModel);
        //await TokenService().saveToken(token:userInfoModel.accessToken.toString());

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
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createAwardInformation({required AwardFormParam awardFormParam})async {
   if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.createAwardInformation(awardFormParam: awardFormParam);
        //await TokenService().saveToken(token:userInfoModel.accessToken.toString());

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
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createBudgetInformation({required BudgetFormParams budgetFormParams}) async{
  if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.createBudgetInformation(budgetFormParams: budgetFormParams);
        //await TokenService().saveToken(token:userInfoModel.accessToken.toString());

        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure(
          exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }
}
