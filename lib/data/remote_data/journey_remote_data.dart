import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/domain/form_params/journey/visa_selection_form_params.dart';
import 'package:japaapp/domain/model/journey/country_prediction_model.dart';
import 'package:japaapp/domain/model/journey/intending_migrant_model.dart';

abstract class JourneyRemoteDataSource {
  Future<CountryPredictionModel> countryPrediction();
  Future< CountryPredictionModel> visaPrediction({required VisaSelectionFormParams visaSelectionFormParams});
  Future< IntendingMigrantProcessModel> intendingMigrantProcess();



}


class JourneyRemoteDataSourceImpl implements JourneyRemoteDataSource{
   final Services _services;

  JourneyRemoteDataSourceImpl({required Services services}) : _services = services;
  @override
  Future<CountryPredictionModel> countryPrediction()async{
   var apiRes= await _services.get(uri:Endpoints.countryPrediction,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return CountryPredictionModel.fromJson(apiRes.data);
  }
  
  @override
  Future<CountryPredictionModel> visaPrediction({required VisaSelectionFormParams visaSelectionFormParams})async {
    var apiRes= await _services.get(uri:Endpoints.visaPrediction,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}",queryParameters: visaSelectionFormParams.toJson());
    return CountryPredictionModel.fromJson(apiRes.data);
  }
  
  @override
  Future<IntendingMigrantProcessModel> intendingMigrantProcess()async {
   var apiRes= await _services.get(uri:Endpoints.intendingMigrant,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return IntendingMigrantProcessModel.fromJson(apiRes.data);
  }
  
}