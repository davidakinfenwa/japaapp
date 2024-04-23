import 'package:flutter/material.dart';
import 'package:japaapp/domain/model/journey/country_prediction_model.dart';



class JourneySnapshotCache with ChangeNotifier {
  static CountryPredictionModel? _countryPredictionModel;
  static CountryPredictionModel? _visaPredictionModel;


  CountryPredictionModel get countryPredictionModel => _countryPredictionModel ?? CountryPredictionModel.empty();
  
  set countryPredictionModel(CountryPredictionModel user) {
    _countryPredictionModel= user;
    notifyListeners();
  }


    CountryPredictionModel get visaPredictionModel => _visaPredictionModel ?? CountryPredictionModel.empty();
  
  set visaPredictionModel(CountryPredictionModel user) {
    _visaPredictionModel= user;
    notifyListeners();
  }

  

}
