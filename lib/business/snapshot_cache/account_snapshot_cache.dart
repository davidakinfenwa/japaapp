import 'package:flutter/material.dart';
import 'package:japaapp/domain/model/models.dart';

class AccountSnapshotCache with ChangeNotifier {
   static CompoundUserInfoModel? _userInfo;
   static CompoundUserInfoModel? _basicUserInfo;
   static CompoundUserInfoModel? _workUserInfo;
  static CompoundUserInfoModel? _userInfoContext;

   static ProfileDropDownModel? _userDropdownInfo;

  CompoundUserInfoModel get userInfo=>_userInfo??CompoundUserInfoModel.empty();
  set userInfor(CompoundUserInfoModel userData){
    _userInfo = _userInfoContext = userData;
    
    notifyListeners();
  }

   CompoundUserInfoModel get basicUserInfo=>_basicUserInfo??CompoundUserInfoModel.empty();
  set basicUserInfo(CompoundUserInfoModel userData){
    _basicUserInfo = userData;
    notifyListeners();
  }

    CompoundUserInfoModel get workUserInfo=>_workUserInfo??CompoundUserInfoModel.empty();
  set workUserInfo(CompoundUserInfoModel userData){
    _workUserInfo = userData;
    notifyListeners();
  }

  
  CompoundUserInfoModel get userInfoContext => _userInfoContext ?? CompoundUserInfoModel.empty();
  set userInfoContext(CompoundUserInfoModel user) {
    _userInfoContext = user;
    notifyListeners();
  }

    ProfileDropDownModel get userDropdownInfo=>_userDropdownInfo??ProfileDropDownModel.empty();
  set userDropdownInfo(ProfileDropDownModel userDropdownInfo){
    _userDropdownInfo=userDropdownInfo;
    notifyListeners();
  }

   void notifyAllListeners() {
    notifyListeners();
  }

}