class Bank {
  String id;
  String name;
  String accountNbr;
  String ibanNbr;

  Bank({
    required this.id,
    required this.name,
    required this.accountNbr,
    required this.ibanNbr,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"].toString(),
        name: json["name"].toString(),
        accountNbr: json["acount_number"].toString(),
        ibanNbr: json["IBAN_number"].toString(),
      );
}
