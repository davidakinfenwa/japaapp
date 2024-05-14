import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/form_params/journey/visa_selection_form_params.dart';
import 'package:japaapp/domain/model/models.dart';

abstract class JourneyRemoteDataSource {
  Future<CountryPredictionModel> countryPrediction();
  Future< CountryPredictionModel> visaPrediction({required VisaSelectionFormParams visaSelectionFormParams});
  Future< IntendingMigrantProcessModel> intendingMigrantProcess();
   Future< IntendingMigrantProcessModel> markAsDone({required MarkTaskDoneFormParams markTaskDoneFormParams});
  Future< IntendingMigrantProcessModel>setDueDate({required SetDueDateFormParams setDueDateFormParams});
  Future< IntendingMigrantProcessModel> deleteTask({required DeleteTaskFormParams deleteTaskFormParams});
  Future<NewMigrantResponseModel> newMigrantProcess({required NewMigrantFormParams newMigrantFormParams});



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
  
  @override
  Future<IntendingMigrantProcessModel> deleteTask({required DeleteTaskFormParams deleteTaskFormParams})async {
   var apiRes= await _services.delete(uri:Endpoints.deleteTask,data: deleteTaskFormParams, authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return IntendingMigrantProcessModel.fromJson(apiRes.data);
  }
  
  @override
  Future<IntendingMigrantProcessModel> markAsDone({required MarkTaskDoneFormParams markTaskDoneFormParams})async {
   var apiRes= await _services.post(uri:Endpoints.markTask,data: markTaskDoneFormParams, authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return IntendingMigrantProcessModel.fromJson(apiRes.data);
  }
  
  @override
  Future<IntendingMigrantProcessModel> setDueDate({required SetDueDateFormParams setDueDateFormParams})async {
    var apiRes= await _services.post(uri:Endpoints.setDueDateTask,data: setDueDateFormParams, authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return IntendingMigrantProcessModel.fromJson(apiRes.data);
  }
  
  @override
  Future<NewMigrantResponseModel> newMigrantProcess({required NewMigrantFormParams newMigrantFormParams})async {
   var apiRes= await _services.get(uri:Endpoints.newMigrant,queryParameters: newMigrantFormParams.toJson(), authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return NewMigrantResponseModel.fromJson(apiRes.data);
  }
  
}