import 'package:flutter/material.dart';
import 'package:japaapp/domain/model/models.dart';


class NewsSnapshotCache with ChangeNotifier {
  static RecentNewsModel? _newsModel;
  static NewsSectionModel? _newsSectionModel;
  static RecentCommunitiesModel? _recentCommunitiesModel;
  static AllCommunitiesModel? _allCommunitiesModel;

  

RecentNewsModel get newsModel=>_newsModel??RecentNewsModel.empty();
set newsModel(RecentNewsModel newsModel){
  _newsModel=newsModel;
}



NewsSectionModel get newsSectionModel=>_newsSectionModel??NewsSectionModel.empty();
set newsSectionModel(NewsSectionModel newsModel){
  _newsSectionModel=newsModel;
}

RecentCommunitiesModel get recentCommunitiesModel=>_recentCommunitiesModel??RecentCommunitiesModel.empty();
set recentCommunitiesModel(RecentCommunitiesModel newsModel){
  _recentCommunitiesModel=newsModel;
}

AllCommunitiesModel get allCommunitiesModel=>_allCommunitiesModel??AllCommunitiesModel.empty();
set allCommunitiesModel(AllCommunitiesModel newsModel){
  _allCommunitiesModel=newsModel;
}

  void notifyAllListeners() {
    notifyListeners();
  }
}