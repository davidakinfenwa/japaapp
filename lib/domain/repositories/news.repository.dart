import 'package:dartz/dartz.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

abstract class NewsRepository{
  Future<Either<Failure<ExceptionMessage>,RecentNewsModel>> recentNews();
}