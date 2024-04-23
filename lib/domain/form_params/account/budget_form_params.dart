
class BudgetFormParams {
    final String budgetedAmount;
    final String isAnyAmount;

    BudgetFormParams({
        required this.budgetedAmount,
        required this.isAnyAmount,
    });

    factory BudgetFormParams.fromJson(Map<String, dynamic> json) => BudgetFormParams(
        budgetedAmount: json["budgeted_amount"],
        isAnyAmount: json["is_any_amount"],
    );

    Map<String, dynamic> toJson() => {
        "budgeted_amount": budgetedAmount,
        "is_any_amount": isAnyAmount,
    };
}
