import 'package:flutter/material.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

class NewsSnapshotCache with ChangeNotifier {
  static RecentNewsModel? _newsModel;
  static NewsSectionModel? _newsSectionModel;

RecentNewsModel get newsModel=>_newsModel??RecentNewsModel.empty();
set newsModel(RecentNewsModel newsModel){
  _newsModel=newsModel;
}



NewsSectionModel get newsSectionModel=>_newsSectionModel??NewsSectionModel.empty();
set newsSectionModel(NewsSectionModel newsModel){
  _newsSectionModel=newsModel;
}

  void notifyAllListeners() {
    notifyListeners();
  }
}