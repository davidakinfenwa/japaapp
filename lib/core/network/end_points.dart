class Endpoints {
  //Authentication Section
  static const String emailRegistration = 'account/create-account';
  static const String emailValidationOtp = 'account/confirm-account';
  static const String resendOtp = 'account/resend-verification-code';
  static const String signUp = 'account/complete-signup';
  static const String signIn = 'auth/login';

  //Account Section
  static const String userInfo = 'profile/user';
  static const String userDropdownInfo = 'profile/form-data';
  static const String createBasicInfo = 'profile/personal-bio';
  static const String createEducationInfo = 'profile/education';
  static const String createWorkInfo = 'profile/work';
  static const String createFamilyInfo = 'profile/family';
  static const String createAwardInfo = 'profile/record';
  static const String createBudgetInfo = 'profile/budget';


  //Journey
  static const String countryPrediction = 'profile/analyse';
  static const String visaPrediction = 'profile/visa-recommendation';
  

  

 
}
