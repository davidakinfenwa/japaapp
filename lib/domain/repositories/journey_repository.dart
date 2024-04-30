import 'package:dartz/dartz.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/journey/visa_selection_form_params.dart';
import 'package:japaapp/domain/model/journey/country_prediction_model.dart';
import 'package:japaapp/domain/model/journey/intending_migrant_model.dart';

abstract class JoruneyRepository{
  Future<Either<Failure<ExceptionMessage>, CountryPredictionModel>> countryPrediction();
  Future<Either<Failure<ExceptionMessage>, CountryPredictionModel>> visaPrediction({required VisaSelectionFormParams visaSelectionFormParams});
  Future<Either<Failure<ExceptionMessage>, IntendingMigrantProcessModel>> intendingMigrantProcess();
}