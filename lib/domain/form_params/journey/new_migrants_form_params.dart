

class NewMigrantFormParams {
    final String countryOfResidence;
    final List<String> interest;

    NewMigrantFormParams({
        required this.countryOfResidence,
        required this.interest,
    });

    factory NewMigrantFormParams.fromJson(Map<String, dynamic> json) => NewMigrantFormParams(
        countryOfResidence: json["country_of_residence"],
        interest: List<String>.from(json["interest"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "country_of_residence": countryOfResidence,
        "interest": List<dynamic>.from(interest.map((x) => x)),
    };
}
