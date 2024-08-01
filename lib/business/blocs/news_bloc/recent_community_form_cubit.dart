// ignore_for_file: no_leading_underscores_for_local_identifiers



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/news_snapshot_cache.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/model/news/communitiy_model.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

import 'package:japaapp/domain/repositories/news_repository.dart';



class RecentCommunityCubit extends Cubit<BlocState<Failure<ExceptionMessage>, RecentCommunitiesModel>> {
  final NewsRepository _repository;
  final NewsSnapshotCache _snapshotCache;

  RecentCommunityCubit({
    required NewsRepository repository,
    required NewsSnapshotCache snapshotCache,
  })  : _repository = repository,
        _snapshotCache = snapshotCache,
        super(const BlocState<Failure<ExceptionMessage>, RecentCommunitiesModel>.initial());

  Future<void> recentCommunity() async {
    emit(const BlocState<Failure<ExceptionMessage>, RecentCommunitiesModel>.loading());

    final _repoEither = await _repository.recentCommunity();
  
    final _state = _repoEither.fold(
      (failure) => BlocState<Failure<ExceptionMessage>, RecentCommunitiesModel>.error(
          failure: failure),
      (response) {
        // cache snapshot
          _snapshotCache.recentCommunitiesModel = response;
        
        return BlocState<Failure<ExceptionMessage>, RecentCommunitiesModel>.success(data: response);
      },
    );

    emit(_state);
  }
}
