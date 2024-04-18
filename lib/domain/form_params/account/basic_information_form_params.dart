import 'package:equatable/equatable.dart';

class BasicInformationFormParams extends Equatable {
  final String countryOfOrigin;
  final String countryOfResidence;
  final String dateOfBirth;
  final String gender;
  final String firstName;
  final String otherName;
  final String surname;
  //final Image image;

 const BasicInformationFormParams({
    required this.countryOfOrigin,
    required this.countryOfResidence,
    required this.dateOfBirth,
    required this.gender,
    required this.firstName,
    required this.otherName,
    required this.surname,
   // required this.image,
  });



  Map<String, dynamic> toJson() => {
    "country_of_origin": countryOfOrigin,
    "country_of_residence": countryOfResidence,
    "date_of_birth":dateOfBirth,
    //"${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
       
    "gender": gender,
    "first_name": firstName,
    "other_name": otherName,
    "last_name": surname,
   // "image": image.toJson(),
  };

  @override
  List<Object?> get props => [
    countryOfOrigin,
    countryOfResidence,
    dateOfBirth,
    gender,
    firstName,
    otherName,
    surname,
    //image,
  ];

   @override
  String toString() {
    return 'BasicInformationFormParams{'
        'countryOfOrigin: $countryOfOrigin, '
        'countryOfResidence: $countryOfResidence, '
        'dateOfBirth: $dateOfBirth, '
        'gender: $gender, '
        'firstName: $firstName, '
        'otherName: $otherName, '
        'surname: $surname}';
        
  }

}

class ImageData extends Equatable {
  final String name;
  final String size;

  ImageData({
    required this.name,
    required this.size,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "size": size,
  };

  @override
  List<Object?> get props => [
    name,
    size,
  ];
}
