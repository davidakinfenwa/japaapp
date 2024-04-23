import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';

abstract class AccountRepository{
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> getAuthenticatedUserProfile();
  Future<Either<Failure<ExceptionMessage>, ProfileDropDownModel>> getProfileDropdownData();
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createBasicInformation({required BasicInformationFormParams basicInformationFormParams, required File? image});
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createEducationInformation({required List<dynamic> educationLevelModel});
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createWorkInformation({required List<dynamic> workLevelModel});
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createFamilyInformation({required FamilyProfileFormModel familyProfileFormModel});
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createAwardInformation({required AwardFormParam awardFormParam});
  Future<Either<Failure<ExceptionMessage>, CompoundUserInfoModel>> createBudgetInformation({required BudgetFormParams budgetFormParams});
}