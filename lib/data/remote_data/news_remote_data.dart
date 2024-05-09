import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/domain/model/news/news_model.dart';

abstract class NewsRemoteDataSource{
  Future<RecentNewsModel> recentNews();
  Future<NewsSectionModel> allNews();


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
  
}