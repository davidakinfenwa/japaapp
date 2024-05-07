// ignore_for_file: no_leading_underscores_for_local_identifiers



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/news_snapshot_cache.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/model/journey/country_prediction_model.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

import 'package:japaapp/domain/repositories/news.repository.dart';



class RecentNewCubit extends Cubit<BlocState<Failure<ExceptionMessage>, RecentNewsModel>> {
  final NewsRepository _repository;
  final NewsSnapshotCache _snapshotCache;

  RecentNewCubit({
    required NewsRepository repository,
    required NewsSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            RecentNewsModel>.initial());

  Future<void> recentNews() async {
    emit(const BlocState<Failure<ExceptionMessage>, RecentNewsModel>.loading());

    final _repoEither = await _repository.recentNews();
  
    final _state = _repoEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, RecentNewsModel>.error(
          failure: failure),
      (response) {
        // cache snapshot
          _snapshotCache.newsModel = response;
        
        return BlocState<Failure<ExceptionMessage>, RecentNewsModel>.success(data: response);
      },
    );

    emit(_state);
  }
}
