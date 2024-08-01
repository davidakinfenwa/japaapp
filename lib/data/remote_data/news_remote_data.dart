import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/domain/model/news/communitiy_model.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

abstract class NewsRemoteDataSource{
  Future<RecentNewsModel> recentNews();
  Future<NewsSectionModel> allNews();
  Future<RecentCommunitiesModel> recentCommunity();
  Future<AllCommunitiesModel> allCommunity();



}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
   final Services _services;

  NewsRemoteDataSourceImpl({required Services services}) : _services = services;

  @override
  Future<RecentNewsModel> recentNews() async {
   var apiRes= await _services.get(uri:Endpoints.recentNews,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return RecentNewsModel.fromJson(apiRes.data);
  }
  
  @override
  Future<NewsSectionModel> allNews() async{
     var apiRes= await _services.get(uri:Endpoints.allNews,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return NewsSectionModel.fromJson(apiRes.data);
  }
  
  @override
  Future<RecentCommunitiesModel> recentCommunity()async {
    var apiRes= await _services.get(uri:Endpoints.recentCommuity,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return RecentCommunitiesModel.fromJson(apiRes.data);
  }
  
  @override
  Future<AllCommunitiesModel> allCommunity()async {
   var apiRes= await _services.get(uri:Endpoints.allCommuity,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return AllCommunitiesModel.fromJson(apiRes.data);
  }
  
}