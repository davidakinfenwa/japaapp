import 'dart:io';

import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';

abstract class AccountRemoteDataSource {
  Future<CompoundUserInfoModel> getUserInfoData();
  Future<ProfileDropDownModel> getProfileDropdownData();
  Future<CompoundUserInfoModel> createBasicInfoData({required BasicInformationFormParams basicInformationFormParams, required File? image});
  Future<CompoundUserInfoModel> createEducationInfoData({required List<dynamic> educationLevelModel});
  Future<CompoundUserInfoModel> createWorkInfoData({required List<dynamic> workLevelModel});

}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
   final Services _services;

  AccountRemoteDataSourceImpl({ required Services services})
      : _services=services;
  @override
  Future<CompoundUserInfoModel> getUserInfoData() async {
    var apiRes= await _services.get(uri:  Endpoints.userInfo,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return CompoundUserInfoModel.fromJson(apiRes.data);
  }
  
  @override
  Future<CompoundUserInfoModel> createBasicInfoData({required BasicInformationFormParams basicInformationFormParams, required File? image}) async{
      var apiRes= await _services.uploadFile(url:Endpoints.createBasicInfo , authorization: "Bearer Bearer ${await TokenService().retrieveToken()}",data: basicInformationFormParams,uploadFile: image);
      return CompoundUserInfoModel.fromJson(apiRes.data);
  }
  
  @override
  Future<ProfileDropDownModel> getProfileDropdownData() async{
   var apiRes= await _services.get(uri:  Endpoints.userDropdownInfo,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
   return ProfileDropDownModel.fromJson(apiRes.data);
  }
  
  @override
  Future<CompoundUserInfoModel> createEducationInfoData({required List<dynamic> educationLevelModel})async {
     Map<String, dynamic> requestData = {
    'education': educationLevelModel,
  };
     var apiRes= await _services.post(uri:Endpoints.createEducationInfo,data: requestData,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return CompoundUserInfoModel.fromJson(apiRes.data);
  }
  
  @override
  Future<CompoundUserInfoModel> createWorkInfoData({required List workLevelModel}) async{
     Map<String, dynamic> requestData = {
    'work': workLevelModel,
  };
     var apiRes= await _services.post(uri:Endpoints.createWorkInfo,data: requestData,authorization: "Bearer Bearer ${await TokenService().retrieveToken()}");
    return CompoundUserInfoModel.fromJson(apiRes.data);
  }

  
  

}