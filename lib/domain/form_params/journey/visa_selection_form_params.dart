

import 'package:equatable/equatable.dart';

class VisaSelectionFormParams extends Equatable {
  final String recommendedCountry;


  const VisaSelectionFormParams(
      {required this.recommendedCountry});

  Map<String, dynamic> toJson() {
    return {
      'recommended_countryt': recommendedCountry,
      
    };
  }

  @override
  List<Object> get props => [recommendedCountry];

  @override
  String toString() =>
      'VisaSelectionFormParams(recommended_country: $recommendedCountry)';
}
