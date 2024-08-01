// ignore_for_file: no_leading_underscores_for_local_identifiers



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/news_snapshot_cache.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

import 'package:japaapp/domain/repositories/news_repository.dart';



class AllNewsCubit extends Cubit<BlocState<Failure<ExceptionMessage>, NewsSectionModel>> {
  final NewsRepository _repository;
  final NewsSnapshotCache _snapshotCache;

  AllNewsCubit({
    required NewsRepository repository,
    required NewsSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>,
            NewsSectionModel>.initial());

  Future<void> allNews() async {
    emit(const BlocState<Failure<ExceptionMessage>, NewsSectionModel>.loading());

    final _repoEither = await _repository.allNews();
  
    final _state = _repoEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, NewsSectionModel>.error(
          failure: failure),
      (response) {
        // cache snapshot
          _snapshotCache.newsSectionModel = response;
        
        return BlocState<Failure<ExceptionMessage>, NewsSectionModel>.success(data: response);
      },
    );

    emit(_state);
  }
}
