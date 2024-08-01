// ignore_for_file: no_leading_underscores_for_local_identifiers



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/news_snapshot_cache.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/model/news/communitiy_model.dart';


import 'package:japaapp/domain/repositories/news_repository.dart';



class AllCommunityCubit extends Cubit<BlocState<Failure<ExceptionMessage>, AllCommunitiesModel>> {
  final NewsRepository _repository;
  final NewsSnapshotCache _snapshotCache;

  AllCommunityCubit({
    required NewsRepository repository,
    required NewsSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>, AllCommunitiesModel>.initial());

  Future<void> recentCommunity() async {
    emit(const BlocState<Failure<ExceptionMessage>, AllCommunitiesModel>.loading());

    final _repoEither = await _repository.allCommunity();
  
    final _state = _repoEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, AllCommunitiesModel>.error(
          failure: failure),
      (response) {
        // cache snapshot
          _snapshotCache.allCommunitiesModel = response;
        
        return BlocState<Failure<ExceptionMessage>, AllCommunitiesModel>.success(data: response);
      },
    );

    emit(_state);
  }
}
