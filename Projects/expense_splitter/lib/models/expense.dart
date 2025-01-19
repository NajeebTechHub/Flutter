class Expense{
  int? id;
  String? description;
  double? amount;
  String? payer;
  List? shareWith;
  DateTime? date;


  Expense({
    this.id,
    this.description,
    this.amount,
    this.payer,
    this.shareWith,
    this.date,
});


  Map toMap(){
    return {
      'id' : id,
      'description': description,
      'amount' : amount,
      'payer' : payer,
      'shareWith' : shareWith?.join(','),
      'date' : date?.toIso8601String(),
    };
  }


  factory Expense.fromMap(Map map){
    return Expense(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      payer: map['payer'],
      shareWith: (map['shareWith'] as String).split(','),
      date: DateTime.parse(map['date']),
    );
  }
}