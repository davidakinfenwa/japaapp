import 'package:flutter/material.dart';
import 'package:japaapp/domain/model/models.dart';



class JourneySnapshotCache with ChangeNotifier {
  static CountryPredictionModel? _countryPredictionModel;
  static CountryPredictionModel? _visaPredictionModel;
  static IntendingMigrantProcessModel? _intendingMigrantProcessModel;
   static IntendingMigrantProcessModel? _actionModel;


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

  IntendingMigrantProcessModel get intendingMigrantProcessModel => _intendingMigrantProcessModel ?? IntendingMigrantProcessModel.empty();
  set intendingMigrantProcessModel(IntendingMigrantProcessModel user) {
    _intendingMigrantProcessModel= user;
    notifyListeners();
  }

   IntendingMigrantProcessModel get actionModel => _actionModel ?? IntendingMigrantProcessModel.empty();
  set actionModel(IntendingMigrantProcessModel user) {
    _actionModel= user;
    notifyListeners();
  }

   void notifyAllListeners() {
    notifyListeners();
  }

}
