// ignore_for_file: no_leading_underscores_for_local_identifiers



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/journey_snapshot_cache.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/form_params/journey/visa_selection_form_params.dart';
import 'package:japaapp/domain/model/journey/country_prediction_model.dart';

import 'package:japaapp/domain/repositories/journey_repository.dart';



class VisaPredictionCubit extends Cubit<BlocState<Failure<ExceptionMessage>, CountryPredictionModel>> {
  final JoruneyRepository _repository;
  final JourneySnapshotCache _snapshotCache;

  VisaPredictionCubit({
    required JoruneyRepository repository,
    required JourneySnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            CountryPredictionModel>.initial());

  Future<void> visaPrediction({required VisaSelectionFormParams visaSelectionFormParams}) async {
    emit(const BlocState<Failure<ExceptionMessage>, CountryPredictionModel>.loading());

    final _signupEither = await _repository.visaPrediction(visaSelectionFormParams: visaSelectionFormParams);

        

    final _state = _signupEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, CountryPredictionModel>.error(
          failure: failure),
      (predictionInfoModel) {
        // cache snapshot
          _snapshotCache.visaPredictionModel = predictionInfoModel;
        
        return BlocState<Failure<ExceptionMessage>, CountryPredictionModel>.success(data: predictionInfoModel);
      },
    );

    emit(_state);
  }
}
