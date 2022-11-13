// Model Budget
class Budget {
  String name;
  String amount;
  String type;
  String date;

  Budget({
    required this.name,
    required this.amount,
    required this.type,
    required this.date,
  });

  // Getter Field
  get getName => name;
  get getAmount => amount;
  get getType => type;
  get getDate => date;
}

// List Data
class DataBudget {
  static List<Budget> data = [];
  void addData(Budget budget) {
    data.add(budget);
  }

  get getData => data;
}
