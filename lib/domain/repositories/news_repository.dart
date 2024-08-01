import 'package:dartz/dartz.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/model/news/communitiy_model.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

abstract class NewsRepository{
  Future<Either<Failure<ExceptionMessage>,RecentNewsModel>> recentNews();
  Future<Either<Failure<ExceptionMessage>,NewsSectionModel>> allNews();
  Future<Either<Failure<ExceptionMessage>,RecentCommunitiesModel>> recentCommunity();
  Future<Either<Failure<ExceptionMessage>,AllCommunitiesModel>> allCommunity();
}