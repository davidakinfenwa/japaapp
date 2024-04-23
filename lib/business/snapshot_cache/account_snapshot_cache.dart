import 'package:flutter/material.dart';
import 'package:japaapp/domain/model/models.dart';

class AccountSnapshotCache with ChangeNotifier {
   static CompoundUserInfoModel? _userInfo;
   static CompoundUserInfoModel? _basicUserInfo;
   static CompoundUserInfoModel? _workUserInfo;
  static CompoundUserInfoModel? _userInfoContext;
  static CompoundUserInfoModel? _eduInfoContext;
  static CompoundUserInfoModel? _familyInfoContext;
  static CompoundUserInfoModel? _awardInfoContext;
  static CompoundUserInfoModel? _budgetInfoContext;

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
     CompoundUserInfoModel get eduInfoContext=>_eduInfoContext??CompoundUserInfoModel.empty();
  set eduInfoContext(CompoundUserInfoModel userData){
    _eduInfoContext = userData;
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

  CompoundUserInfoModel get familyInfoContext=>_familyInfoContext??CompoundUserInfoModel.empty();
  set familyInfoContext(CompoundUserInfoModel userData){
    _familyInfoContext = userData;
    notifyListeners();
  }
   CompoundUserInfoModel get awardInfoContext=>_awardInfoContext??CompoundUserInfoModel.empty();
  set awardInfoContext(CompoundUserInfoModel userData){
    _awardInfoContext = userData;
    notifyListeners();
  }
  CompoundUserInfoModel get budgetInfoContext=>_budgetInfoContext??CompoundUserInfoModel.empty();
  set budgetInfoContext(CompoundUserInfoModel userData){
    _budgetInfoContext = userData;
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