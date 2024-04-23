

import 'package:equatable/equatable.dart';

class CompoundUserInfoModel extends Equatable {
  final String status;
  final UserData data;

 const CompoundUserInfoModel({
    required this.status,
    required this.data,
  });

  factory CompoundUserInfoModel.fromJson(Map<String, dynamic> json) => CompoundUserInfoModel(
    status: json["status"],
    data: UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };


  factory CompoundUserInfoModel.empty() {
    return CompoundUserInfoModel(
      status: '',
      data: UserData.empty(),
    );
  }

   @override
  List<Object?> get props => [status, data];

  @override
  String toString() {
    return 'CompoundUserInfoModel(status: $status, data: $data)';
  }
}

class UserData extends Equatable{
  final User user;
  final Profile profile;
  final List<Education> education;
  final FamilyStructure familyStructure;
  final List<WorkUser> work;
  final List<RecordAward> record;
  final Budget budget;

  UserData({
    required this.user,
    required this.profile,
    required this.education,
    required this.familyStructure,
    required this.work,
    required this.record,
    required this.budget,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    user: json["user"]!=null? User.fromJson(json["user"]):User.empty(),
    profile:json["profile"]!=null? Profile.fromJson(json["profile"]):Profile.empty(),
    education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
    familyStructure:json["familyStructure"]!=null? FamilyStructure.fromJson(json["familyStructure"]):FamilyStructure.empty(),
    work: List<WorkUser>.from(json["work"].map((x) => WorkUser.fromJson(x))),
    record: List<RecordAward>.from(json["record"].map((x) => RecordAward.fromJson(x))),
    budget:json["budget"]!=null? Budget.fromJson(json["budget"]):Budget.empty(),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "profile": profile.toJson(),
    "education": List<dynamic>.from(education.map((x) => x.toJson())),
    "familyStructure": familyStructure.toJson(),
    "work": List<dynamic>.from(work.map((x) => x.toJson())),
    "record": List<dynamic>.from(record.map((x) => x.toJson())),
    "budget": budget.toJson(),
  };

  factory UserData.empty() {
    return UserData(
      user: User.empty(),
      profile: Profile.empty(),
      education: [],
      familyStructure: FamilyStructure.empty(),
      work: [],
      record: [],
      budget: Budget.empty(),
    );
  }

   @override
  List<Object?> get props => [user, profile, education, familyStructure, work, record, budget];

  @override
  String toString() {
    return 'UserData(user: $user, profile: $profile, education: $education, familyStructure: $familyStructure, work: $work, record: $record, budget: $budget)';
  }
}


class FamilyStructure {
    final List<Family> family;
    final List<FamilyWork> work;
    final List<FamilyEducation> education;

    FamilyStructure({
        required this.family,
        required this.work,
        required this.education,
    });

    factory FamilyStructure.fromJson(Map<String, dynamic> json) => FamilyStructure(
        family: List<Family>.from(json["family"].map((x) => Family.fromJson(x))),
        work: List<FamilyWork>.from(json["work"].map((x) => FamilyWork.fromJson(x))),
        education: List<FamilyEducation>.from(json["education"].map((x) => FamilyEducation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "family": List<dynamic>.from(family.map((x) => x.toJson())),
        "work": List<dynamic>.from(work.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
    };

    factory FamilyStructure.empty() {
      return FamilyStructure(family: [], work: [], education: []);
    }
}

class Budget extends Equatable{
  final String id;
  final String userId;
  final String budgetedAmount;
  final String isAnyAmount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Budget({
    required this.id,
    required this.userId,
    required this.budgetedAmount,
    required this.isAnyAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => Budget(
    id: json["id"],
    userId: json["user_id"],
    budgetedAmount: json["budgeted_amount"],
    isAnyAmount: json["is_any_amount"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "budgeted_amount": budgetedAmount,
    "is_any_amount": isAnyAmount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  factory Budget.empty() {
    return Budget(
      id: '',
      userId: '',
      budgetedAmount: '',
      isAnyAmount: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
  @override
  List<Object?> get props => [id, userId, budgetedAmount, isAnyAmount, createdAt, updatedAt];

  @override
  String toString() {
    return 'Budget(id: $id, userId: $userId, budgetedAmount: $budgetedAmount, isAnyAmount: $isAnyAmount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

// Define empty constructors for other classes in a similar manner


class Education extends Equatable  {
    final dynamic id;
    final dynamic userId;
    final String levelOfEducation;
    final String institution;
    final DateTime fromDate;
    final DateTime toDate;
    final dynamic major;
    final dynamic scale;
    final dynamic grade;
    final dynamic isStillInschool;
    final DateTime createdAt;
    final DateTime updatedAt;

    Education({
        required this.id,
        required this.userId,
        required this.levelOfEducation,
        required this.institution,
        required this.fromDate,
        required this.toDate,
        required this.major,
        required this.scale,
        required this.grade,
        required this.isStillInschool,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        userId: json["user_id"],
        levelOfEducation: json["level_of_education"],
        institution: json["institution"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        major: json["major"],
        scale: json["scale"],
        grade: json["grade"],
        isStillInschool: json["is_still_inschool"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "level_of_education": levelOfEducation,
        "institution": institution,
        "from_date": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
        "to_date": "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
        "major": major,
        "scale": scale,
        "grade": grade,
        "is_still_inschool": isStillInschool,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
     @override
  List<Object?> get props => [id, userId, levelOfEducation, institution, fromDate, toDate, major, scale, grade, isStillInschool, createdAt, updatedAt];

  @override
  String toString() {
    return 'Education{id: $id, userId: $userId, levelOfEducation: $levelOfEducation, institution: $institution, fromDate: $fromDate, toDate: $toDate, major: $major, scale: $scale, grade: $grade, isStillInschool: $isStillInschool, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
  factory Education.empty(){
    return Education(id: "", userId: "", levelOfEducation: "", institution: "", fromDate: DateTime.now(), toDate: DateTime.now(), major: "", scale: "", grade: "", isStillInschool: "0", createdAt: DateTime.now(), updatedAt: DateTime.now());
  }
}




class FamilyEducation extends Equatable  {
    final dynamic id;
    final dynamic familyStructureId;
    final dynamic userId;
    final String levelOfEducation;
    final String institution;
    final DateTime fromDate;
    final DateTime toDate;
    final dynamic major;
    final dynamic scale;
    final dynamic grade;
    final dynamic isStillInschool;
    final DateTime createdAt;
    final DateTime updatedAt;

    FamilyEducation({
        required this.id,
        required this.familyStructureId,
        required this.userId,
        required this.levelOfEducation,
        required this.institution,
        required this.fromDate,
        required this.toDate,
        required this.major,
        required this.scale,
        required this.grade,
        required this.isStillInschool,
        required this.createdAt,
        required this.updatedAt,
    });

    factory FamilyEducation.fromJson(Map<String, dynamic> json) => FamilyEducation(
        id: json["id"],
        familyStructureId: json["familyStructureId"],
        userId: json["user_id"],
        levelOfEducation: json["level_of_education"],
        institution: json["institution"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        major: json["major"],
        scale: json["scale"],
        grade: json["grade"],
        isStillInschool: json["is_still_inschool"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "familyStructureId":familyStructureId,
        "user_id": userId,
        "level_of_education": levelOfEducation,
        "institution": institution,
        "from_date": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
        "to_date": "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
        "major": major,
        "scale": scale,
        "grade": grade,
        "is_still_inschool": isStillInschool,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
     @override
  List<Object?> get props => [id, userId, levelOfEducation, institution, fromDate, toDate, major, scale, grade, isStillInschool, createdAt, updatedAt,familyStructureId];

  @override
  String toString() {
    return 'FamilyEducation{id: $id, userId: $userId, levelOfEducation: $levelOfEducation, institution: $institution, fromDate: $fromDate, toDate: $toDate, major: $major, scale: $scale, grade: $grade, isStillInschool: $isStillInschool, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
  factory FamilyEducation.empty(){
    return FamilyEducation(id: "", userId: "", levelOfEducation: "", institution: "", fromDate: DateTime.now(), toDate: DateTime.now(), major: "", scale: "", grade: "", isStillInschool: "0", createdAt: DateTime.now(), updatedAt: DateTime.now(),familyStructureId: "");
  }
}


class Family extends Equatable {
  final dynamic id;
  final dynamic userId;
  final String maritalStatus;
  final dynamic firstName;
  final dynamic surname;
  final dynamic otherName;
  final dynamic numberOfChildren;
  final DateTime createdAt;
  final DateTime updatedAt;

  Family({
    required this.id,
    required this.userId,
    required this.maritalStatus,
    required this.firstName,
    required this.surname,
    required this.otherName,
    required this.numberOfChildren,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, maritalStatus, firstName, surname, otherName, numberOfChildren, createdAt, updatedAt];

  factory Family.fromJson(Map<String, dynamic> json) => Family(
    id: json["id"],
    userId: json["user_id"],
    maritalStatus: json["marital_status"],
    firstName: json["first_name"],
    surname: json["surname"],
    otherName: json["other_name"],
    numberOfChildren: json["number_of_children"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "marital_status": maritalStatus,
    "first_name": firstName,
    "surname": surname,
    "other_name": otherName,
    "number_of_children": numberOfChildren,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Family{id: $id, userId: $userId, maritalStatus: $maritalStatus, firstName: $firstName, surname: $surname, otherName: $otherName, numberOfChildren: $numberOfChildren, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

class Profile extends Equatable {
  final String id;
  final String userId;
  final String countryOfOrigin;
  final String countryOfResidence;
  final String dateOfBirth;
  final String gender;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.countryOfOrigin,
    required this.countryOfResidence,
    required this.dateOfBirth,
    required this.gender,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, countryOfOrigin, countryOfResidence, dateOfBirth, gender, image, createdAt, updatedAt];

 factory Profile.fromJson(Map<String, dynamic> json) => Profile(
  id: json["id"] != null ? json["id"] : '',
  userId: json["user_id"] != null ? json["user_id"] : '',
  countryOfOrigin: json["country_of_origin"] != null ? json["country_of_origin"] : '',
  countryOfResidence: json["country_of_residence"] != null ? json["country_of_residence"] : '',
  dateOfBirth: json["date_of_birth"] != null ? json["date_of_birth"] : '',
  gender: json["gender"] != null ? json["gender"] : '',
  image: json["image"] != null ? json["image"] : '',
  createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
  updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
);


  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "country_of_origin": countryOfOrigin,
    "country_of_residence": countryOfResidence,
    "date_of_birth": dateOfBirth,
    "gender": gender,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Profile{id: $id, userId: $userId, countryOfOrigin: $countryOfOrigin, countryOfResidence: $countryOfResidence, dateOfBirth: $dateOfBirth, gender: $gender, image: $image, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
  factory Profile.empty(){
    return Profile(id: "", userId: "", countryOfOrigin: "", countryOfResidence: "", dateOfBirth: "", gender: "", image: "", createdAt: DateTime.now(), updatedAt: DateTime.now());
  }
}

class RecordAward extends Equatable {
  final dynamic id;
  final dynamic userId;
  final String type;
  final String title;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;

  RecordAward({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, type, title, date, createdAt, updatedAt];

  factory RecordAward.fromJson(Map<String, dynamic> json) => RecordAward(
    id: json["id"],
    userId: json["user_id"],
    type: json["type"],
    title: json["title"],
    date: DateTime.parse(json["date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "type": type,
    "title": title,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Record{id: $id, userId: $userId, type: $type, title: $title, date: $date, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
  factory RecordAward.empty(){
    return RecordAward(id: "", userId: "", type: "", title: "", date: DateTime.now(), createdAt: DateTime.now(), updatedAt: DateTime.now());
  }
}

// 


class User {
    final dynamic id;
    final String email;
    final String firstName;
    final String otherName;
    final String lastName;
    final String phoneNumber;
    final String password;
    final dynamic rememberToken;
    final DateTime emailVerifiedAt;
    final String status;
    final String accountStatusState;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.email,
        required this.firstName,
        required this.otherName,
        required this.lastName,
        required this.phoneNumber,
        required this.password,
        required this.rememberToken,
        required this.emailVerifiedAt,
        required this.status,
        required this.accountStatusState,
        required this.createdAt,
        required this.updatedAt,
    });

factory User.fromJson(Map<String, dynamic> json) {
  return User(
    id: json["id"] != null ? json["id"] : '',
    email: json["email"] != null ? json["email"] : '',
    firstName: json["first_name"] != null ? json["first_name"] : '',
    otherName: json["other_name"] != null ? json["other_name"] : '',
    lastName: json["last_name"] != null ? json["last_name"] : '',
    phoneNumber: json["phone_number"] != null ? json["phone_number"] : '',
    password: json["password"] != null ? json["password"] : '',
    rememberToken: json["remember_token"] != null ? json["remember_token"] : '',
    emailVerifiedAt: json["email_verified_at"] != null ? DateTime.parse(json["email_verified_at"]) : DateTime.now(),
    status: json["status"] != null ? json["status"] : '',
    accountStatusState: json["account_status_state"] != null ? json["account_status_state"] : '',
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
  );
}


    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "other_name": otherName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "password": password,
        "remember_token": rememberToken,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "status": status,
        "account_status_state": accountStatusState,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };

  factory User.empty() {
    return User(
      id: '',
      email: '',
      firstName: '',
      otherName: '',
      lastName: '',
      phoneNumber: '',
      password: '',
      rememberToken: null,
      emailVerifiedAt: DateTime.now(),
      status: '',
      accountStatusState: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
    
}




class WorkUser extends Equatable {
  final dynamic id;
  final dynamic userId;
  final String companyName;
  final String position;
  final DateTime dateFrom;
  final DateTime dateTo;
  final dynamic isCurrentWork;
  final DateTime createdAt;
  final DateTime updatedAt;

  WorkUser({
    required this.id,
    required this.userId,
    required this.companyName,
    required this.position,
    required this.dateFrom,
    required this.dateTo,
    required this.isCurrentWork,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, companyName, position, dateFrom, dateTo, isCurrentWork, createdAt, updatedAt];

  factory WorkUser.fromJson(Map<String, dynamic> json) => WorkUser(
    id: json["id"],
    userId: json["user_id"],
    companyName: json["company_name"],
    position: json["position"],
    dateFrom: DateTime.parse(json["date_from"]),
    dateTo: DateTime.parse(json["date_to"]),
    isCurrentWork: json["is_current_work"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "company_name": companyName,
    "position": position,
    "date_from": "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
    "date_to": "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
    "is_current_work": isCurrentWork,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Work{id: $id, userId: $userId, companyName: $companyName, position: $position, dateFrom: $dateFrom, dateTo: $dateTo, isCurrentWork: $isCurrentWork, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
  factory WorkUser.empty(){
    return WorkUser(id: "", userId: "", companyName: "", position: "", dateFrom: DateTime.now(), dateTo: DateTime.now(), isCurrentWork: "", createdAt: DateTime.now(), updatedAt: DateTime.now());
  }
}





class FamilyWork extends Equatable {
  final dynamic id;
  final dynamic familyStructureId;
  final dynamic userId;
  final String companyName;
  final String position;
  final DateTime dateFrom;
  final DateTime dateTo;
  final dynamic isCurrentWork;
  final DateTime createdAt;
  final DateTime updatedAt;

  FamilyWork({
    required this.id,
     required this.familyStructureId,
    required this.userId,
    required this.companyName,
    required this.position,
    required this.dateFrom,
    required this.dateTo,
    required this.isCurrentWork,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, companyName, position, dateFrom, dateTo, isCurrentWork, createdAt, updatedAt];

  factory FamilyWork.fromJson(Map<String, dynamic> json) => FamilyWork(
    id: json["id"],
    familyStructureId: json["familyStructureId"],
    userId: json["user_id"],
    companyName: json["company_name"],
    position: json["position"],
    dateFrom: DateTime.parse(json["date_from"]),
    dateTo: DateTime.parse(json["date_to"]),
    isCurrentWork: json["is_current_work"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "company_name": companyName,
    "position": position,
    "date_from": "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
    "date_to": "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
    "is_current_work": isCurrentWork,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'FamilyWork{id: $id, userId: $userId, companyName: $companyName, position: $position, dateFrom: $dateFrom, dateTo: $dateTo, isCurrentWork: $isCurrentWork, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
  factory FamilyWork.empty(){
    return FamilyWork(id: "", userId: "", companyName: "", position: "", dateFrom: DateTime.now(), dateTo: DateTime.now(), isCurrentWork: "", createdAt: DateTime.now(), updatedAt: DateTime.now(),familyStructureId: "");
  }
}

