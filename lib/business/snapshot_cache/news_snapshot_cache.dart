import 'package:flutter/material.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

class NewsSnapshotCache with ChangeNotifier {
  static RecentNewsModel? _newsModel;

RecentNewsModel get newsModel=>_newsModel??RecentNewsModel.empty();
set newsModel(RecentNewsModel newsModel){
  _newsModel=newsModel;
}

}