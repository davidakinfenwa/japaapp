import 'package:dartz/dartz.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/exceptions/exception_code.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/exceptions/failure.dart';
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/remote_data/journey_remote_data.dart';
import 'package:japaapp/domain/form_params/journey/task_form_params.dart';
import 'package:japaapp/domain/form_params/journey/visa_selection_form_params.dart';
import 'package:japaapp/domain/model/journey/country_prediction_model.dart';
import 'package:japaapp/domain/model/journey/intending_migrant_model.dart';
import 'package:japaapp/domain/model/journey/task_action_model.dart';
import 'package:japaapp/domain/repositories/journey_repository.dart';

class JourneyRepoImp implements JoruneyRepository{
   final NetworkInfo _networkInfo;
  //final AuthLocalDataSource _localDataSource;
  final JourneyRemoteDataSource _remoteDataSource;

  JourneyRepoImp({required NetworkInfo networkInfo, required JourneyRemoteDataSource remoteDataSource}) : _networkInfo = networkInfo, _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Failure<ExceptionMessage>, CountryPredictionModel>> countryPrediction() async{
     
      if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.countryPrediction();
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
  Future<Either<Failure<ExceptionMessage>, CountryPredictionModel>> visaPrediction({required VisaSelectionFormParams visaSelectionFormParams})async {
     if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.visaPrediction(visaSelectionFormParams: visaSelectionFormParams);
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
  Future<Either<Failure<ExceptionMessage>, IntendingMigrantProcessModel>> intendingMigrantProcess() async {
     if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.intendingMigrantProcess();
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
  Future<Either<Failure<ExceptionMessage>, IntendingMigrantProcessModel>> deleteTask({required DeleteTaskFormParams deleteTaskFormParams}) async{
    if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.deleteTask(deleteTaskFormParams: deleteTaskFormParams);
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
  Future<Either<Failure<ExceptionMessage>, IntendingMigrantProcessModel>> markAsDone({required MarkTaskDoneFormParams markTaskDoneFormParams})async {
   if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.markAsDone(markTaskDoneFormParams: markTaskDoneFormParams);
        
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
  Future<Either<Failure<ExceptionMessage>, IntendingMigrantProcessModel>> setDueDate({required SetDueDateFormParams setDueDateFormParams}) async{
    if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.setDueDate(setDueDateFormParams: setDueDateFormParams);
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