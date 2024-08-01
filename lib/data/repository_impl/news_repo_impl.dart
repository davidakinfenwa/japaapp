import 'package:dartz/dartz.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/remote_data/news_remote_data.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/domain/repositories/news_repository.dart';

class NewsRepoImp implements NewsRepository{
   final NetworkInfo _networkInfo;
  //final AuthLocalDataSource _localDataSource;
  final NewsRemoteDataSource _remoteDataSource;

  NewsRepoImp({required NetworkInfo networkInfo, required NewsRemoteDataSource remoteDataSource}) : _networkInfo = networkInfo, _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure<ExceptionMessage>, RecentNewsModel>> recentNews() async {
    if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.recentNews();
        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure(exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }
  
  @override
  Future<Either<Failure<ExceptionMessage>, NewsSectionModel>> allNews()async {
     if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.allNews();
        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure( exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }
  
  @override
  Future<Either<Failure<ExceptionMessage>, RecentCommunitiesModel>> recentCommunity() async{
   if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.recentCommunity();
        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure( exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }
  
  @override
  Future<Either<Failure<ExceptionMessage>, AllCommunitiesModel>> allCommunity() async{
   if ((await _networkInfo.isConnected)) {
      try {
        final userInfoModel = await _remoteDataSource.allCommunity();
        return right(userInfoModel);
      } on ExceptionType<ExceptionMessage> catch (e) {
        return left(Failure.serverFailure(exception: e));
      }
    } else {
      return left(const Failure.serverFailure( exception: ExceptionMessages.NO_INTERNET_CONNECTION));
    }
  }


}